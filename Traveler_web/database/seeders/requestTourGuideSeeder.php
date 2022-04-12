<?php

namespace Database\Seeders;

use App\Models\requestTourGuide;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class requestTourGuideSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        requestTourGuide::factory()->count(10)->create();
    }
}


