<?php

namespace App\Views\Composers;

use App\Models\Tag;
use App\Models\Post;
use App\Models\About;
use Illuminate\View\View;

class FooterComposer
{
    public function compose(View $view)
    {
        $this->composePosts($view);
        $this->composeTags($view);
        $this->composeAbout($view);
    }

    private function composePosts(View $view)
    {
        $postsFooter = Post::published()->orderByViews()->get()->take(5);
        $view->with('postsFooter', $postsFooter);
    }

    private function composeTags(View $view)
    {
        $tags = Tag::whereHas('posts', function ($p) {
            $p->published();
        })->get();
        $view->with('tags', $tags);
    }

    private function composeAbout(View $view)
    {
        $about = About::first();
        $view->with('about', $about);
    }
}
