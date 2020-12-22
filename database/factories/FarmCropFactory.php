<?php

namespace Database\Factories;

use App\Models\FarmCrop;
use Illuminate\Database\Eloquent\Factories\Factory;

class FarmCropFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = FarmCrop::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'crop_id' => $this->faker->randomDigitNotNull,
        'planting_date' => $this->faker->word,
        'area' => $this->faker->word
        ];
    }
}
