<?php

namespace App\Http\Controllers\Backend;

use App\Models\Testimony;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Http\Controllers\Controller;
use App\Http\Requests\TestimonyStoreRequest;
use App\Http\Requests\TestimonyUpdateRequest;

class TestimonyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request)
    {
        // return Carbon::now();
        $testimony = Testimony::select([
            'id',
            'name',
            'job',
            'star',
            'created_at'
        ]);

        if ($request->ajax()) {
            return Datatables::eloquent($testimony)
                ->addIndexColumn()
                ->addColumn('action', function ($testimony) {
                    return view('backend.datatable._action', [
                        'model'         => $testimony,
                        'delete_url'    => route('testimony.destroy', $testimony->id),
                        'edit_url'      => route('testimony.edit', $testimony->id),
                    ]);
                })
                ->editColumn('star', function ($testimony) {
                    return "<input class='star' type='hidden' value='{$testimony->star}'>";
                })
                ->editColumn('created_at', function ($testimony) {
                    return $testimony->created_at->translatedFormat('d F Y');
                })
                ->rawColumns(['action', 'star'])
                ->make(true);
        }
        return view('backend.testimony.index');
    }

    public function create(Testimony $testimony)
    {
        $this->authorize('isAdmin', Testimony::class);
        return view('backend.testimony.create', compact('testimony'));
    }

    public function store(TestimonyStoreRequest $request)
    {
        $this->authorize('isAdmin', Testimony::class);

        $testimony = Testimony::create($request->all());

        $testimony
            ->addMedia($request->image)
            ->toMediaCollection('image');

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $testimony->name has been created successfully"
        ]);
        return redirect()->route('testimony.index');
    }

    public function edit(Testimony $testimony)
    {
        $this->authorize('isAdmin', Testimony::class);

        return view('backend.testimony.edit', compact('testimony'));
    }

    public function update(TestimonyUpdateRequest $request, $id)
    {
        $this->authorize('isAdmin', Testimony::class);

        $testimony = Testimony::findOrFail($id);

        $testimony->update($request->all());

        if ($request->hasFile('image')) {
            $testimony
                ->addMedia($request->image)
                ->toMediaCollection('image');
        }

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $testimony->title has been updated successfully"
        ]);
        return redirect()->route('testimony.index');
    }


    public function destroy(Request $request, $id)
    {
        $this->authorize('isAdmin', Testimony::class);

        $testimony = Testimony::findOrFail($id);

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $testimony->title has been deleted successfully"
        ]);

        $testimony->destroy($id);

        return redirect()->route('testimony.index');
    }
}
