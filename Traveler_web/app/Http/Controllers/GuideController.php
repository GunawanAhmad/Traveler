<?php

namespace App\Http\Controllers;

use App\Models\Guide;

class GuideController extends Controller
{
    function index() {
        $guides = Guide::all();
        return view('daftar_guide', ['guides' => $guides]);
    }

    function detail_guide() {
        $id = last(request()->segments());
        $guide = Guide::find($id);
        return view('Info_guide', ['guide' => $guide]);
    }
}