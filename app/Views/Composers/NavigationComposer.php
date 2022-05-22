<?php

namespace App\Views\Composers;

use App\Models\Tag;
use App\Models\Post;
use Illuminate\View\View;
use App\Models\PostCategory;

class NavigationComposer
{
    public function compose(View $view)
    {
        $this->composePostCategories($view);
        $this->composePopularPost($view);
        $this->composeTags($view);
        $this->composeArchives($view);
    }

    private function composePostCategories(View $view)
    {
        $categories = PostCategory::with(['posts' => function ($query) {
            $query->published();
        }])->orderBy('title', 'ASC')->get();
        $view->with('categories', $categories);
    }

    private function composePopularPost(View $view)
    {
        $popularPost = Post::with('author', 'media')->published()->orderByViews()->get()->take(3);
        $view->with('popularPost', $popularPost);
    }

    private function composeArchives(View $view)
    {
        $archives = Post::archives();

        $view->with('archives', $archives);
    }

    private function composeTags(View $view)
    {
        $tags = Tag::whereHas('posts', function ($p) {
            $p->published();
        })->get();
        $view->with('tags', $tags);
    }
}
