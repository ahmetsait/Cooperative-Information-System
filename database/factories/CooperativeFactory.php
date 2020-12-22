<?php

namespace Database\Factories;

use App\Models\Cooperative;
use Illuminate\Database\Eloquent\Factories\Factory;

class CooperativeFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Cooperative::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->company,
            'establishment_date' => $this->faker->date(),
            'founder_id' => \App\Models\Farmer::pluck('id')[$this->faker->numberBetween(1, \App\Models\Farmer::count() - 1)],
            'president_id' => \App\Models\Farmer::pluck('id')[$this->faker->numberBetween(1, \App\Models\Farmer::count() - 1)],
            'city_code' => \App\Models\City::pluck('code')[$this->faker->numberBetween(1, \App\Models\City::count() - 1)],
            'address' => $this->faker->address,
            'email' => $this->faker->email
        ];
    }
}
