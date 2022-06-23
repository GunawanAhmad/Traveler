<?php

namespace Database\Seeders;

use App\Models\Customer;
use App\Models\DaftarWisata;
use App\Models\Favorite;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => env('ADMIN_NAME'),
            'email' => env('ADMIN_EMAIL'),
            'password'=> bcrypt(env('ADMIN_PASS')),
        ]);

        $this->customer();
        $this->wisata();
        $this->favorite();
    }

    public function wisata() {
        DaftarWisata::factory()->count(20)->create();
    }

    public function customer() {
        Customer::factory()->count(20)->create();
    }

    public function favorite() {
        Favorite::factory()->count(20)->create();
    }
}