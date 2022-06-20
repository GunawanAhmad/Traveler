<?php

namespace App\Http\Controllers\API;

use Exception;
use App\Models\DaftarWisata as Wisata;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;



class CustomerController extends Controller
{
    public function getWisata() {
        try {
            $wisata = Wisata::all();
            return ResponseFormatter::success([
                'wisata' => $wisata,
            ],'Success');
        } catch(Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
        }
    }
}