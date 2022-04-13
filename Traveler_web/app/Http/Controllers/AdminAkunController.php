<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class AdminAkunController extends Controller
{
    function edit_view() {
        $id = Auth::id();
        $adminData = User::find($id);
        return view('Edit_Akun', ['adminData' => $adminData]);
    }

    function edit_akun(Request $request) {
        $id = Auth::id();
        $admin = User::find($id);
        $admin->name = $request->nama;
        if($request->file('foto')) {
            Storage::delete('/public/images/'.$admin->foto);
            $nama_foto = $request->file('foto')->hashName();
            $request->file('foto')->store('public/images');
            $admin->foto = $nama_foto;
        }
        $admin->save();
        return redirect('/');
    }
}