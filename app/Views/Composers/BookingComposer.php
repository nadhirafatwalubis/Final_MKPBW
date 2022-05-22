<?php

namespace App\Views\Composers;

use Illuminate\View\View;
use App\Models\Destination;

class BookingComposer
{
    public function compose(View $view)
    {
        $this->composeRoom($view);
    }
    private function composeRoom(View $view)
    {
        $destination = Destination::all()->pluck('name', 'slug');
        $view->with('destinationBookings', $destination);
    }
}
