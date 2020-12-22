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
            'name' => $this->faker->word,
        'establishment_date' => $this->faker->word,
        'founder_id' => $this->faker->word,
        'president_id' => $this->faker->word,
        'city_code' => $this->faker->randomDigitNotNull,
        'address' => $this->faker->word,
        'email' => $this->faker->word,
        'member_count' => $this->faker->randomDigitNotNull
        ];
    }
}
