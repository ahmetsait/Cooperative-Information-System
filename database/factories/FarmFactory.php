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
            'registration' => $this->faker->date('Y-m-d H:i:s'),
        'owner_id' => $this->faker->word,
        'city_code' => $this->faker->randomDigitNotNull,
        'latitude' => $this->faker->randomDigitNotNull,
        'longitude' => $this->faker->randomDigitNotNull,
        'area' => $this->faker->word,
        'soil_type' => $this->faker->randomDigitNotNull,
        'unit_worth' => $this->faker->word
        ];
    }
}
