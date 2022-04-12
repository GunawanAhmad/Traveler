<?php

namespace App\Http\Controllers;

use App\Models\requestTourGuide;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class requestTourGuideController extends Controller
{

    function requestTourGuide () {
        $data =  requestTourGuide::all();
        return view('request_guide',['data' => $data]);
    }
}
