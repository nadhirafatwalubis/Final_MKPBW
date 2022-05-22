<?php

namespace Database\Seeders;

use App\Models\Welcome;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class WelcomeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('welcomes')->truncate();

        $welcome                   = new Welcome();

        $welcome->title    = "Welcome to Pacific";
        $welcome->subtitle = "It's time to start your adventure";
        $welcome->message  = "<p> A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p> <p> Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>";
        $welcome->save();

        $welcome
            ->addMedia(public_path('images/data/welcome/image.jpg'))
            ->preservingOriginal()
            ->toMediaCollection('image');
    }
}
