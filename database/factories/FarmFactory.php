<?php

namespace Database\Factories;

use App\Models\Farm;
use Illuminate\Database\Eloquent\Factories\Factory;

class FarmFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Farm::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'registration' => $this->faker->date(),
            'owner_id' => \App\Models\Farmer::pluck('id')[$this->faker->numberBetween(1, \App\Models\Farmer::count() - 1)],
            'city_code' => \App\Models\City::pluck('code')[$this->faker->numberBetween(1, \App\Models\City::count() - 1)],
            'latitude' => $this->faker->randomFloat(2,-90,90),
            'longitude' => $this->faker->randomFloat(2,-180,180),
            'area' => $this->faker->numberBetween(1,2000),
            'soil_type' => \App\Models\SoilType::pluck('id')[$this->faker->numberBetween(1, \App\Models\SoilType::count() - 1)],
            'unit_worth' => $this->faker->numberBetween(100,20000)
        ];
    }
}
