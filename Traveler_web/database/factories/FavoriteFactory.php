<?php

namespace Database\Factories;

use App\Models\Customer;
use App\Models\DaftarWisata;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\favorite>
 */
class FavoriteFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'customer_id' => Customer::inRandomOrder()->first()->id,
            'wisata_id' => DaftarWisata::inRandomOrder()->first()->id,
        ];
    }
}