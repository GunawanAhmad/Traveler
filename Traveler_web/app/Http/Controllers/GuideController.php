<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class GuideController extends Controller
{
    function index() {
        $guides = User::where([['role', '=', 'guide']])->get();
        return view('daftar_guide', ['guides' => $guides]);
    }

    function detail_guide() {
        $id = last(request()->segments());
        $guide = User::find($id);
        return view('Info_guide', ['guide' => $guide]);
    }
}