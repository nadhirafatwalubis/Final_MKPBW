<?php

namespace App\Views\Composers;

use App\Models\About;
use Illuminate\View\View;

class AboutComposer
{
    public function compose(View $view)
    {
        $this->composeAbout($view);
    }

    private function composeAbout(View $view)
    {
        $about = About::first();
        views($about)->record();
        $view->with('about', $about);
    }
}
