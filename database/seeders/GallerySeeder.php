<?php

namespace Database\Seeders;

use Faker\Factory;
use App\Models\Gallery;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class GallerySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('galleries')->truncate();
        $faker = Factory::create('id_ID');
        foreach (range(1, 10) as $key => $i) {
            $title = $faker->sentence(mt_rand(4, 6));
            $gallery = Gallery::create([
                'title' => $title,
                'slug'  => Str::slug($title),
            ]);

            $gallery
                ->addMedia(public_path('images/data/gallery/') . 'images-(' . rand(1, 40) . ').jpg')
                ->preservingOriginal()
                ->toMediaCollection('cover');

            foreach (range(1, 12) as $key => $i) {
                $gallery
                    ->addMedia(public_path('images/data/gallery/') . 'images-(' . rand(1, 40) . ').jpg')
                    ->preservingOriginal()
                    ->toMediaCollection('images');
            }
        }
    }
}
