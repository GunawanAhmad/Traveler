<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('menu');
});


Route::get('/login', function () {
    return view('login');
});


Route::get('/daftar_wisata', function () {
    return view('daftar_wisata');
});


Route::get('/tambah_wisata', function () {
    return view('tambah_wisata');
});

Route::get('/request_guide', function () {
    return view('request_guide');
});

Route::get('/daftar_guide', function () {
    return view('daftar_guide');
});
Route::get('/Edit_Akun', function () {
    return view('Edit_Akun');
});
