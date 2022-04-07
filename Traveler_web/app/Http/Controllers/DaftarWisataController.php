<?php

namespace App\Http\Controllers;

use App\Models\DaftarWisata;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class DaftarWisataController extends Controller
{
    function index() {
        return view('daftar_wisata');
    }

    function store(Request $request) {
        

        $validator = Validator::make($request->all(), ['foto' => 'image|mimes:jpg|max:500', 'alamat' => 'required'], ['foto.max'=> 'ukuran file maksimal 500 KB', 'foto.mimes'=>'tipe file hanya boleh jpg', 'alamat.required' => 'alamat tidak boleh kosong']);
        if($validator->fails()) {
            $error = $validator->errors()->first();
            return redirect()->back()->withErrors(['msg' => $error]);
        }
        
        $model = DaftarWisata::create($request->all());
        if($request->file('foto')) {
            $name = $request->file('foto')->hashName();
            $request->file('foto')->store('public/images');
            $model->update(['foto' => $name]);
        }
        return redirect('/');
    }

    function tambah_wisata_view() {
        return view('tambah_wisata');
    }
}