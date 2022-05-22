<?php

namespace Database\Factories;

use App\Models\PostCategory;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostCategoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    protected $model = PostCategory::class;

    public function definition()
    {
        return [
            'title'        => $this->faker->word(),
            'slug'         => $this->faker->slug(),
        ];
    }
}
