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
            'id' => strval($this->faker->numberBetween(10000000000,99999999999)),
            'registration' => $this->faker->date(),
            'name' => $this->faker->firstName,
            'surname' => $this->faker->lastName,
            'birthday' => $this->faker->date(),
            'phone' => $this->faker->phoneNumber,
            'email' => $this->faker->email,
            'address' => $this->faker->address
        ];
    }
}
