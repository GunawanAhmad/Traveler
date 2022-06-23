<?php

namespace App\Http\Controllers\API;

use Exception;
use App\Models\DaftarWisata as Wisata;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Favorite;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function dashboardCustomer() {
        try {
            $random_wisata = Wisata::inRandomOrder()->limit(5)->get();
            $popular_place = DB::table('favorites')
            ->select('wisata_id', DB::raw('COUNT(*) AS cnt'), 'daftar_wisatas.*')
            ->groupBy('wisata_id')
            ->orderByRaw('COUNT(*) DESC')->join('daftar_wisatas', 'daftar_wisatas.id', 'favorites.wisata_id')
            ->first();
            return ResponseFormatter::success([
                'wisata' => $random_wisata,
                'popular' => $popular_place,
            ],'Success');
        } catch(Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
        }
    }
}