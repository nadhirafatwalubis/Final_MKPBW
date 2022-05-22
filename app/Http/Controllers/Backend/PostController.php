<?php

namespace App\Http\Controllers\Backend;

use Carbon\Carbon;
use App\Models\Post;

use Illuminate\Support\Arr;
use App\Models\PostCategory;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Gate;
use Intervention\Image\Facades\Image;
use App\Http\Requests\PostStoreRequest;
use App\Http\Requests\PostUpdateRequest;
use App\Models\Tag;
use Illuminate\Support\Facades\Storage;
use \Cviebrock\EloquentSluggable\Services\SlugService;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $uploadPath;
    public function __construct()
    {
        $this->uploadPath = 'post';
    }
    public function index(Request $request)
    {
        // return Carbon::now();
        $posts = Post::with(['author', 'post_category'])->select([
            'posts.id',
            'posts.title',
            'author_id',
            'post_category_id',
            'posts.published_at',
            'posts.created_at',
        ]);

        if (request('p') == 'trash') {
            $posts = $posts->onlyTrashed();
        } elseif (request('p') == 'own') {
            $posts = $posts->where('author_id', auth()->id());
        } elseif (request('p') == 'published') {
            $posts = $posts->published();
        } elseif (request('p') == 'scheduled') {
            $posts = $posts->scheduled();
        } elseif (request('p') == 'draft') {
            $posts = $posts->draft();
        }

        if ($request->ajax()) {

            return Datatables::eloquent($posts)
                ->editColumn('title', '{!! Str::limit($title, 45) !!}')
                ->addColumn('action', function ($post) {

                    if (request('p') == 'trash') {
                        return view('backend.datatable._actionTrash', [
                            'model'         => $post,
                            'force_destroy_url'    => route('post.forceDestroy', $post->id),
                            'restore_url'      => route('post.restore', $post->id),
                        ]);
                    }
                    return view('backend.datatable._actionPost', [
                        'model'         => $post,
                        'delete_url'    => route('post.destroy', $post->id),
                        'edit_url'      => route('post.edit', $post->id),
                    ]);
                })
                ->editColumn('created_at', function ($post) {
                    return $post->dateStatus();
                })
                ->rawColumns(['action', 'created_at'])
                ->make(true);
        }
        $statusList = collect($this->statusList());
        return view('backend.post.index', compact('statusList'));
    }

    public function statusList()
    {
        return [
            'own'       => auth()->user()->posts()->count(),
            'all'       => Post::count(),
            'published' => Post::published()->count(),
            'scheduled' => Post::scheduled()->count(),
            'draft'     => Post::draft()->count(),
            'trash'     => Post::onlyTrashed()->count(),
        ];
    }

    public function create(Post $post)
    {
        $categories = PostCategory::all();
        $tags = Tag::all();
        $selectedTags = old('post_tags', $post->tags->pluck('name')->toArray());
        return view('backend.post.create', compact('post', 'categories', 'tags', 'selectedTags'));
    }

    public function store(PostStoreRequest $request)
    {
        $data = $this->handleRequest($request);
        $post = $request->user()->posts()->create($data);
        $post->createTags($data["post_tags"]);

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $post->title has been created successfully"
        ]);
        return redirect()->route('post.index');
    }

    public function edit(Post $post)
    {
        $this->authorize('checkUser', $post);
        $selectedTags = old('post_tags', $post->tags->pluck('name')->toArray());
        $categories = PostCategory::all();
        $tags = Tag::all();
        return view('backend.post.edit', compact('post', 'categories', 'tags', 'selectedTags'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PostUpdateRequest $request, $id)
    {
        $post = Post::findOrFail($id);

        $this->authorize('checkUser', $post);

        $data = $this->handleRequest($request);
        $post->update($data);

        $post->createTags($data["post_tags"]);

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $post->title has been updated successfully"
        ]);
        return redirect()->route('post.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function destroy(Request $request)
    {
        $dataId = $request->data;

        $msg = '';

        if (is_array($dataId)) {
            foreach ($dataId as $id) {
                $post = Post::find($id);

                if ($post) {
                    if (Gate::allows('checkUser', $post)) {
                        $post->destroy($id);
                    } else {
                        $msg = "one or more selected data is not belongs to you.
                                <strong class='d-block'>it can't be deleted</strong>";
                        continue;
                    }
                }
            }
        } else {
            $post = Post::findOrFail($dataId);
            if (Gate::allows('checkUser', $post)) {
                $post->destroy($dataId);
            } else {
                $msg = "this data is not belongs to you.
                            <strong class='d-block'>it can't be deleted</strong>";
            }
        }

        return response()->json(['msg' => $msg]);
    }

    public function forceDestroy(Request $request)
    {
        $dataId = $request->data;
        $msg = '';

        if (is_array($dataId)) {
            foreach ($dataId as $id) {
                $post = Post::withTrashed()->find($id);
                if (Gate::allows('checkUser', $post)) {
                    if ($post->image) {
                        $this->removeImage($post->image);
                    }
                    $post->forceDelete($id);
                } else {
                    $msg = "one or more selected data is not belongs to you.
                            <strong class='d-block'>it can't be deleted</strong>";
                    continue;
                }
            }
        } else {
            $post = Post::withTrashed()->findOrFail($dataId);
            if (Gate::allows('checkUser', $post)) {
                if ($post->image) {
                    $this->removeImage($post->image);
                }
                $post->forceDelete($dataId);
            } else {
                $msg = "this data is not belongs to you.
                <strong class='d-block'>it can't be deleted</strong>";
            }
        }
        return response()->json(['msg' => $msg]);
    }

    public function restore(Request $request)
    {
        $msg = '';

        $data = $request->data;

        if (is_array($data)) {
            foreach ($data as $id) {
                $post = Post::withTrashed()->find($id);
                if ($post) {
                    if (Gate::allows('checkUser', $post)) {
                        $post->restore();
                    } else {
                        $msg = "one or more selected data is not belongs to you.
                                <strong class='d-block'>it can't be restored</strong>";
                        continue;
                    }
                }
            }
        } else {
            $post = Post::withTrashed()->find($data);
            if ($post) {
                if (Gate::allows('checkUser', $post)) {
                    $post->restore();
                } else {
                    $msg = "this data is not belongs to you.
                            <strong class='d-block'>it can't be restored</strong>";
                }
            }
        }

        return response()->json(['msg' => $msg]);
    }
    private function handleRequest($request)
    {
        $data = $request->except(['_method', '_token', 'oldImage']);
        if ($request->hasFile('image')) {
            // hapus old image jika ada
            if ($request->oldImage) {
                $this->removeImage($request->oldImage);
            }

            // proses upload image
            $image       = $request->file('image');
            $extension   = $image->extension();

            $successUploaded = $image->store($this->uploadPath);

            // proses upload thumbnail
            if ($successUploaded) {
                $path = Storage::path($successUploaded);
                $thumbnail = str_replace(".{$extension}", "-thumb.{$extension}", $path);
                $width     = '400';
                // fungsi widen lebih efektif dipakai dari resize
                // karena lebar gambar akan menyesuaikan tinggi otomatis
                Image::make($path)
                    ->widen($width)
                    ->save($thumbnail);
            }
            $data['image'] = $successUploaded;
        }
        return $data;
    }


    private function removeImage($image)
    {
        if (!empty($image)) {
            $ext           = substr(strrchr($image, '.'), 1);
            $thumbnail     = str_replace(".{$ext}", "-thumb.{$ext}", $image);

            if (Storage::exists($image)) Storage::delete($image);
            if (Storage::exists($thumbnail)) Storage::delete($thumbnail);
        }
    }

    public function checkSlug(Request $request)
    {
        $slug = SlugService::createSlug(Post::class, 'slug', $request->slug);
        return response()->json(['slug' => $slug]);
    }
}
