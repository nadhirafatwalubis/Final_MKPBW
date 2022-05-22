<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use App\Models\PostCategory;
use App\Models\Tag;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    protected $limit = 6;

    public function index()
    {
        $posts = Post::with(['author', 'post_category', 'tags', 'media'])
            ->filter(request(['s', 'm', 'y']))
            ->latest()
            ->published()
            ->paginate($this->limit)->withQueryString();
        return view('frontend.blog.index', compact('posts'));
    }

    public function show(Post $post)
    {
        views($post)->record();
        $searchAll = true;
        return view('frontend.blog.show', compact('post', 'searchAll'));
    }

    public function category(PostCategory $category)
    {
        $categoryName = $category->title;

        $posts = $category->posts()
            ->published()
            ->filter(request(['s', 'm', 'y']))
            ->latest()
            ->with(['author', 'post_category', 'tags', 'media'])
            ->paginate($this->limit);
        return view('frontend.blog.index', compact('posts', 'categoryName'));
    }

    public function author(User $author)
    {
        $authorName = $author->name;

        $posts = $author->posts()
            ->published()
            ->filter(request(['s', 'm', 'y']))
            ->latest()
            ->with(['author', 'post_category', 'tags', 'media'])
            ->paginate($this->limit);
        return view('frontend.blog.index', compact('posts', 'authorName'));
    }

    public function tag(Tag $tag)
    {
        $tagName = $tag->name;

        $posts = $tag->posts()
            ->published()
            ->filter(request(['s', 'm', 'y']))
            ->latest()
            ->with(['author', 'post_category', 'tags', 'media'])
            ->paginate($this->limit);
        return view('frontend.blog.index', compact('posts', 'tagName'));
    }
}
