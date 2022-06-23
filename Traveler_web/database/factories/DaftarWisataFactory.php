<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\DaftarWisata>
 */
class DaftarWisataFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'nama_daerah' => $this->faker->lexify(),
            'provinsi' => $this->faker->lexify(),
            'foto' => 'img/monas.jpg',
            'alamat' => $this->faker->lexify(),
            'deskripsi' => $this->faker->lexify(),
        ];
    }
}