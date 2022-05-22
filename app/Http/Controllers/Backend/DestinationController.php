<?php

namespace App\Http\Controllers\Backend;

use App\Models\Destination;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Http\Controllers\Controller;
use App\Http\Requests\DestinationStoreRequest;
use App\Http\Requests\DestinationUpdateRequest;
use Cviebrock\EloquentSluggable\Services\SlugService;

class DestinationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request)
    {
        $destination = Destination::select([
            'id',
            'name',
            'price',
            'capacity',
            'location',
            'created_at'
        ]);

        if ($request->ajax()) {
            return Datatables::eloquent($destination)
                ->addIndexColumn()
                ->addColumn('action', function ($destination) {
                    return view('backend.datatable._action', [
                        'model'         => $destination,
                        'delete_url'    => route('destination.destroy', $destination->id),
                        'edit_url'      => route('destination.edit', $destination->id),
                    ]);
                })
                ->editColumn('price', function ($destination) {
                    return 'Rp. ' . $destination->price_formated;
                })
                ->editColumn('created_at', function ($destination) {
                    return $destination->created_at->translatedFormat('d F Y');
                })
                ->rawColumns(['action', 'addImage'])
                ->make(true);
        }
        return view('backend.destination.index');
    }

    public function create(Destination $destination)
    {
        $this->authorize('isAdmin', Destination::class);
        return view('backend.destination.create', compact('destination'));
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

    public function store(DestinationStoreRequest $request)
    {
        $this->authorize('isAdmin', Destination::class);

        $destination = Destination::create($request->all());

        $destination
            ->addMedia($request->cover)
            ->toMediaCollection('cover');

        foreach ($request->input('images', []) as $file) {
            $destination->addMedia($this->uploadPath() . '/' . $file)->toMediaCollection('images');
        }

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $destination->name has been created successfully"
        ]);

        return redirect()->route('destination.index');
    }

    public function edit(Destination $destination)
    {
        $this->authorize('isAdmin', Destination::class);

        return view('backend.destination.edit', compact('destination'));
    }

    public function update(DestinationUpdateRequest $request, $id)
    {
        $this->authorize('isAdmin', Destination::class);

        $destination = Destination::findOrFail($id);

        $destination->update($request->all());


        if (count($destination->images) > 0) {
            foreach ($destination->images as $media) {
                if (!in_array($media->file_name, $request->input('images', []))) {
                    $media->delete();
                }
            }
        }

        $media = $destination->images->pluck('file_name')->toArray();

        foreach ($request->input('images', []) as $file) {
            if (count($media) === 0 || !in_array($file, $media)) {
                $destination->addMedia($this->uploadPath() . '/' . $file)->toMediaCollection('images');
            }
        }

        if ($request->hasFile('cover')) {
            $destination
                ->addMedia($request->cover)
                ->toMediaCollection('cover');
        }

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $destination->title has been updated successfully"
        ]);
        return redirect()->route('destination.index');
    }


    public function destroy(Request $request, $id)
    {
        $this->authorize('isAdmin', Destination::class);

        $destination = Destination::findOrFail($id);

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $destination->title has been deleted successfully"
        ]);

        $destination->destroy($id);

        return redirect()->route('destination.index');
    }

    public function checkSlug(Request $request)
    {
        $slug = SlugService::createSlug(Destination::class, 'slug', $request->slug);
        return response()->json(['slug' => $slug]);
    }

    private function uploadPath()
    {
        return storage_path('app/tmp/' . auth()->user()->id . '/destination');
    }
}
