<?php

namespace App\Http\Controllers;

use App\Models\DaftarWisata;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

;
use Illuminate\Support\Facades\Validator;


class DaftarWisataController extends Controller
{
    function index() {
        $data =  DaftarWisata::all();
        return view('daftar_wisata', ['data' => $data]);
    }

    function store(Request $request) {
        

        $validator = Validator::make($request->all(), ['foto' => 'image|mimes:jpeg,jpg,png,gif|max:500', 'alamat' => 'required'], ['foto.max'=> 'ukuran file maksimal 500 KB', 'foto.mimes'=>'tipe file hanya boleh jpeg,jpg,png,gif', 'alamat.required' => 'alamat tidak boleh kosong']);
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
        return view('form_wisata');
    }

    function hapus_wisata(Request $request) {
        $id = $request->id;
        $wisata = DaftarWisata::find($id);
        Storage::delete('/public/images/'.$wisata->foto);
        $wisata->delete();
        return response()->json(['succes' => 'Daftar wisata berhasil dihapus']);
    }

    function edit_wisata_view() {
        $id = last(request()->segments());
        $wisata = DaftarWisata::find($id);
        return view('form_wisata', ['data' => $wisata, 'edit' => true]);
    }

    function edit_wisata(Request $request) {
        $validator = Validator::make($request->all(), ['foto' => 'image|mimes:jpeg,jpg,png,gif|max:500', 'alamat' => 'required'], ['foto.max'=> 'ukuran file maksimal 500 KB', 'foto.mimes'=>'tipe file hanya boleh jpeg,jpg,png,gif', 'alamat.required' => 'alamat tidak boleh kosong']);
        if($validator->fails()) {
            $error = $validator->errors()->first();
            return redirect()->back()->withErrors(['msg' => $error]);
        }
        
        $id = last(request()->segments());
        $model = DaftarWisata::find($id);
        $foto_name = $model->foto;
        $model->update($request->all());
        if($request->file('foto')) {
            Storage::delete('/public/images/'.$foto_name);
            $name = $request->file('foto')->hashName();
            $request->file('foto')->store('public/images');
            $model->update(['foto' => $name]);
        }

        return redirect('/daftar_wisata');
    }
}