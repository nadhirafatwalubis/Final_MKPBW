<?php

namespace Database\Factories;

use App\Models\Room;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

class RoomFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    protected $model = Room::class;

    public function definition()
    {
        $image = "room/room-image-". mt_rand(1,5) . ".jpg";
        $name = $this->faker->sentence(mt_rand(2,3));
        return [
            'name'        => $name,
            'slug'         => Str::slug($name),
            'desc'         => collect($this->faker->paragraphs(mt_rand(6,15)))
                                ->map( fn ($p) => "<p> $p </p>" )
                                ->implode(''),
            'image'        => $image,
            'price'         => mt_rand(200000,400000),
            'bed'         => $this->faker->word(2),
            'capacity'    => mt_rand(2,5),
            'facility'    => view('vendor.roomfacility'),
            'location'    => Arr::random(['Iboih','Rubiah Island', 'Sumur Tiga','Kota Atas']),
            'created_at'   => $this->faker->dateTimeBetween($startDate = '-4 months', $endDate = 'now', $timezone = null),
        ];
    }
}
