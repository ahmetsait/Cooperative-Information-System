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
            'member_id' => $this->faker->word,
        'registration' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
