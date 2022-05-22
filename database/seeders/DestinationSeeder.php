<?php

namespace Database\Seeders;

use App\Models\Destination;
use Faker\Factory;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DestinationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('destinations')->truncate();
        $faker = Factory::create('id_ID');
        foreach (range(1, 10) as $key => $i) {
            $name = $faker->sentence(mt_rand(4, 6));
            $gallery = Destination::create([
                'name'       => $name,
                'slug'       => Str::slug($name),
                'desc'       => collect($faker->paragraphs(mt_rand(6, 15)))
                    ->map(fn ($p) => "<p> $p </p>")
                    ->implode(''),
                'price'      => mt_rand(200000, 400000),
                'capacity'   => mt_rand(2, 5),
                'facility'   => view('vendor.roomfacility'),
                'location'   => Arr::random(['Sabang', 'Banda Aceh', 'Medan', 'Pulau Banyak']),
                'created_at' => $faker->dateTimeBetween($startDate = '-4 months', $endDate = 'now', $timezone = null),
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
