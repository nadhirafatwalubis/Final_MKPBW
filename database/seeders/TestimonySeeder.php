<?php

namespace Database\Seeders;

use Faker\Factory;
use App\Models\Testimony;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TestimonySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('testimonies')->truncate();
        $faker = Factory::create('id_ID');
        foreach (range(1, 10) as $key => $i) {
            $testimony = Testimony::create([
                'name'      => $faker->name(),
                'job'       => $faker->jobTitle(),
                'star'      => mt_rand(1, 5),
                'message'   => $faker->sentence(mt_rand(15, 20)),
            ]);

            $testimony
                ->addMedia(public_path('images/data/testimony/') . 'person-' . rand(1, 4) . '.jpg')
                ->preservingOriginal()
                ->toMediaCollection('image');
        }
    }
}
