<?php

namespace Database\Factories;

use App\Models\Farmer;
use Illuminate\Database\Eloquent\Factories\Factory;

class FarmerFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Farmer::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'registration' => $this->faker->date('Y-m-d H:i:s'),
        'name' => $this->faker->word,
        'surname' => $this->faker->word,
        'birthday' => $this->faker->word,
        'phone' => $this->faker->word,
        'email' => $this->faker->word,
        'address' => $this->faker->word,
        'experience' => $this->faker->randomDigitNotNull
        ];
    }
}
