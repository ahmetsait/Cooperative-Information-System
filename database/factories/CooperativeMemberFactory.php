<?php

namespace Database\Factories;

use App\Models\CooperativeMember;
use Illuminate\Database\Eloquent\Factories\Factory;

class CooperativeMemberFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = CooperativeMember::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'member_id' => \App\Models\Farmer::pluck('id')[$this->faker->numberBetween(1, \App\Models\Farmer::count() - 1)],
            'cooperative_id' => \App\Models\Cooperative::pluck('id')[$this->faker->numberBetween(1, \App\Models\Cooperative::count() - 1)],
            'registration' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
