<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class BookingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $sd = $this->faker->dateTimeBetween($startDate = '-2 days', $endDate = 'now', $timezone = null)->format('d-m-Y');
        $ed = $this->faker->dateTimeBetween($startDate = $sd, $endDate = '+' . mt_rand(5, 15) . 'days', $timezone = null)->format('d-m-Y');

        return [
            'checkin_date'  => $sd,
            'checkout_date' => $ed,
            'name'          => $this->faker->name(),
            'phone'         => $this->faker->phoneNumber(),
            'created_at'    => $sd,
            'destination_id'       => mt_rand(1, 10)
        ];
    }
}
