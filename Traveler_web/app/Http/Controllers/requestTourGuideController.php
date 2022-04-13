<?php

namespace App\Http\Controllers;

use App\Models\requestTourGuide;
use App\Models\User;

class requestTourGuideController extends Controller
{

    function requestTourGuide () {
        $data =  requestTourGuide::all();
        return view('request_guide',['data' => $data]);
    }

    function acc() {
        $id = last(request()->segments());
        $requestGuide = requestTourGuide::find($id);
        $user = new User();
        $user->name = $requestGuide->name;
        $user->email = $requestGuide->email;
        $user->password = $requestGuide->password;
        $user->foto = $requestGuide->foto;
        $user->ttl = $requestGuide->ttl;
        $user->no_hp = $requestGuide->no_hp;
        $user->role = $requestGuide->role;
        $user->save();
        $requestGuide->delete();
        return redirect('/daftar_guide');
    }

    function reject() {
        $id = last(request()->segments());
        $requestGuide = requestTourGuide::find($id);
        $requestGuide->delete();
        return redirect()->back();
    }
}