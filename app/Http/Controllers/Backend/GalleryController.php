<?php

namespace App\Http\Controllers\Backend;

use App\Models\Gallery;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Http\Controllers\Controller;
use App\Http\Requests\GalleryStoreRequest;
use App\Http\Requests\GalleryUpdateRequest;
use Cviebrock\EloquentSluggable\Services\SlugService;

class GalleryController extends Controller
{

    public function index(Request $request)
    {
        $gallery = Gallery::select([
            'id',
            'title',
            'created_at'
        ]);

        if ($request->ajax()) {
            return Datatables::eloquent($gallery)
                ->addIndexColumn()
                ->addColumn('action', function ($gallery) {
                    return view('backend.datatable._action', [
                        'model'         => $gallery,
                        'delete_url'    => route('gallery.destroy', $gallery->id),
                        'edit_url'      => route('gallery.edit', $gallery->id),
                    ]);
                })

                ->editColumn('created_at', function ($gallery) {
                    return $gallery->created_at->translatedFormat('d F Y');
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('backend.gallery.index');
    }

    public function create(Gallery $gallery)
    {
        $this->authorize('isAdmin', Gallery::class);
        return view('backend.gallery.create', compact('gallery'));
    }

    public function storeMedia(Request $request)
    {
        $path = $this->uploadPath();

        if (!file_exists($path)) {
            mkdir($path, 0777, true);
        }

        $file = $request->file('file');

        $name = uniqid() . '_' . trim($file->getClientOriginalName());

        $file->move($path, $name);

        return response()->json([
            'name'          => $name,
            'original_name' => $file->getClientOriginalName(),
        ]);
    }

    public function deleteMedia(Request $request)
    {
        $path = $this->uploadPath();

        $filePath = $path . '/' . $request->filename;

        if (file_exists($filePath)) unlink($filePath);
    }

    public function store(GalleryStoreRequest $request)
    {
        $this->authorize('isAdmin', Gallery::class);

        $gallery = Gallery::create($request->all());

        $gallery
            ->addMedia($request->cover)
            ->toMediaCollection('cover');

        foreach ($request->input('images', []) as $file) {
            $gallery->addMedia($this->uploadPath() . '/' . $file)->toMediaCollection('images');
        }

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $gallery->name has been created successfully"
        ]);

        return redirect()->route('gallery.index');
    }

    public function edit(Gallery $gallery)
    {
        $this->authorize('isAdmin', Gallery::class);

        return view('backend.gallery.edit', compact('gallery'));
    }

    public function update(GalleryUpdateRequest $request, $id)
    {
        $this->authorize('isAdmin', Gallery::class);

        $gallery = Gallery::findOrFail($id);

        $gallery->update($request->all());


        if (count($gallery->images) > 0) {
            foreach ($gallery->images as $media) {
                if (!in_array($media->file_name, $request->input('images', []))) {
                    $media->delete();
                }
            }
        }

        $media = $gallery->images->pluck('file_name')->toArray();

        foreach ($request->input('images', []) as $file) {
            if (count($media) === 0 || !in_array($file, $media)) {
                $gallery->addMedia($this->uploadPath() . '/' . $file)->toMediaCollection('images');
            }
        }

        if ($request->hasFile('cover')) {
            $gallery
                ->addMedia($request->cover)
                ->toMediaCollection('cover');
        }

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $gallery->title has been updated successfully"
        ]);
        return redirect()->route('gallery.index');
    }


    public function destroy(Request $request, $id)
    {
        $this->authorize('isAdmin', Gallery::class);

        $gallery = Gallery::findOrFail($id);

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $gallery->title has been deleted successfully"
        ]);

        $gallery->destroy($id);

        return redirect()->route('gallery.index');
    }

    public function checkSlug(Request $request)
    {
        $slug = SlugService::createSlug(Gallery::class, 'slug', $request->slug);
        return response()->json(['slug' => $slug]);
    }

    private function uploadPath()
    {
        return storage_path('app/tmp/' . auth()->user()->id . '/gallery');
    }
}
