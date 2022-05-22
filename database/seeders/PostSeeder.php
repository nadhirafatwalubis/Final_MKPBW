<?php

namespace Database\Seeders;

use Faker\Factory;
use App\Models\Post;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('posts')->truncate();

        $faker = Factory::create('id_ID');
        $publishedAt = $faker->dateTimeBetween($startDate = '-1 years', $endDate = '+5 days', $timezone = null);

        foreach (range(1, 10) as $key => $i) {
            $title = $faker->sentence(mt_rand(4, 6));
            $post = Post::create([
                'author_id'        => mt_rand(1, 10),
                'post_category_id' => mt_rand(1, 5),
                'title'            => $title,
                'slug'             => Str::slug($title),
                'excerpt'          => $faker->paragraph(),
                'body' => collect($faker->paragraphs(mt_rand(6, 15)))
                    ->map(fn ($p) => "<p> $p </p>")
                    ->implode(''),
                'published_at' => mt_rand(0, 1) == 1 ? $publishedAt : NULL,
                'created_at'   => $faker->dateTimeBetween($startDate = '-4 months', $endDate = 'now', $timezone = null),
            ]);

            $post
                ->addMedia(public_path('images/data/post/') . 'post_image_' . rand(1, 5) . '.jpg')
                ->preservingOriginal()
                ->toMediaCollection('image');
        }
    }
}
