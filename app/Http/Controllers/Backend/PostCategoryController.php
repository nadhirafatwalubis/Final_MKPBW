<?php

namespace App\Http\Controllers\Backend;

use Carbon\Carbon;
use App\Models\Post;

use Illuminate\Support\Arr;
use App\Models\PostCategory;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Http\Controllers\Controller;
use App\Http\Requests\PostCategoryStoreRequest;

use App\Http\Requests\PostCategoryUpdateRequest;
use App\Http\Requests\PostCategoryDestroyRequest;
use \Cviebrock\EloquentSluggable\Services\SlugService;

class PostCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request)
    {
        // return Carbon::now();
        $categories = PostCategory::with(['posts'])->select([
            'post_categories.id',
            'title',
            'slug',
            'created_at'
        ])
            // ->withCount('posts');
            ->withCount(['posts' => function ($query) {
                $query->withTrashed();
            }]);

        if ($request->ajax()) {
            return Datatables::eloquent($categories)
                ->addIndexColumn()
                ->editColumn('title', '{!! Str::limit($title, 60) !!}')
                ->addColumn('action', function ($category) {
                    return view('backend.datatable._actionForbidden', [
                        'model'         => $category,
                        'delete_url'    => route('post-category.destroy', $category->id),
                        'edit_url'      => route('post-category.edit', $category->id),
                    ]);
                })
                ->editColumn('created_at', function ($category) {
                    return $category->created_at->translatedFormat('d F Y');
                })
                ->make(true);
        }
        return view('backend.post-category.index');
    }



    public function create(PostCategory $post_category)
    {
        $this->authorize('isAdmin', PostCategory::class);
        return view('backend.post-category.create', compact('post_category'));
    }

    public function store(PostCategoryStoreRequest $request)
    {
        $this->authorize('isAdmin', PostCategory::class);

        $category = PostCategory::create($request->all());
        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $category->title has been created successfully"
        ]);
        return redirect()->route('post-category.index');
    }

    public function edit(PostCategory $post_category)
    {
        $this->authorize('isAdmin', PostCategory::class);

        return view('backend.post-category.edit', compact('post_category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PostCategoryUpdateRequest $request, $id)
    {
        $this->authorize('isAdmin', PostCategory::class);

        $category = PostCategory::findOrFail($id);
        $category->update($request->all());
        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $category->title has been updated successfully"
        ]);
        return redirect()->route('post-category.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function destroy(PostCategoryDestroyRequest $request, $id)
    {
        $this->authorize('isAdmin', PostCategory::class);

        Post::withTrashed()->where('post_category_id', $id)->update(['post_category_id' => 1]);
        $category = PostCategory::findOrFail($id);

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $category->title has been deleted successfully"
        ]);
        $category->destroy($id);

        return redirect()->route('post-category.index');
    }

    public function checkSlug(Request $request)
    {
        $slug = SlugService::createSlug(PostCategory::class, 'slug', $request->slug);
        return response()->json(['slug' => $slug]);
    }
}
