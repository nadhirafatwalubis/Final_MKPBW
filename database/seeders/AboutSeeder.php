<?php

namespace Database\Seeders;

use App\Models\About;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AboutSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('abouts')->truncate();

        $about                   = new About();
        $about->title            = "Make Your Tour Memorable and Safe With Us";
        $about->desc             = "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.";
        $about->video            = "https://www.youtube.com/watch?v=9NnAoSOm5-E";
        $about->address          = '198 West 21th Street, Suite 721 New York NY 10016';
        $about->address_url      = '#';
        $about->phone            = '0812 0000 1111';
        $about->wa               = '+62 822 7454 3802';
        $about->email            = 'admin@site.com';
        $about->fb               = '@fbusername';
        $about->ig               = '@igusername';
        $about->yt               = '@youtubechannel';
        $about->tw               = '@twitter';
        $about->save();

        $about
            ->addMedia(public_path('images/data/about/image.jpg'))
            ->preservingOriginal()
            ->toMediaCollection('image');
        $about
            ->addMedia(public_path('images/data/about/image-header.jpg'))
            ->preservingOriginal()
            ->toMediaCollection('image_header');
    }
}
