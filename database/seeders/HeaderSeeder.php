<?php

namespace Database\Seeders;

use App\Models\Header;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class HeaderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('headers')->truncate();

        $header          = new Header();
        $header->title   = "Welcome to Pacific";
        $header->caption = '<h1 class="mb-4">Discover Your Favorite Place with Us</h1>
                                <p class="caps">Travel to the any corner of the world, without going around in circles</p>';
        $header->video_url = "https://www.youtube.com/watch?v=9NnAoSOm5-E";
        $header->save();

        $header
            ->addMedia(public_path('images/data/header/image.jpg'))
            ->preservingOriginal()
            ->toMediaCollection('image');
        $header
            ->addMedia(public_path('images/data/header/image-other.jpg'))
            ->preservingOriginal()
            ->toMediaCollection('image_other');
    }
}
