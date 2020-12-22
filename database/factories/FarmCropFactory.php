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
            'farm_id' => \App\Models\Farm::pluck('id')[$this->faker->numberBetween(1, \App\Models\Farm::count() - 1)],
            'crop_id' => \App\Models\Crop::pluck('id')[$this->faker->numberBetween(1, \App\Models\Crop::count() - 1)],
            'planting_date' => $this->faker->date(),
            'area' => $this->faker->numberBetween(1,2000)
        ];
    }
}
