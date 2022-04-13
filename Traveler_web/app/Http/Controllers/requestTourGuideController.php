<?php

namespace App\Http\Controllers;

use App\Models\requestTourGuide;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class requestTourGuideController extends Controller
{

    function requestTourGuide () {
        $data =  requestTourGuide::all();
        return view('request_guide',['data' => $data]);
    }

    function accTourGuide () {
        $id = last(request()->segments());
        $requestTourGuide = requestTourGuide::find($id);
        $array = (array) $requestTourGuide;
        Log::info($array);
        $model = User::create($array);
        
        return redirect('/daftar_guide');
    }
}

