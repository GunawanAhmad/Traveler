<?php

use App\Http\Controllers\LoginController;
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
})->middleware('auth');


Route::post('/login', [LoginController::class, 'login']);
Route::get('/login', [LoginController::class, 'index'])->middleware('guest')->name('login');


Route::get('/daftar_wisata', function () {
    return view('daftar_wisata');
})->middleware('auth');


Route::get('/tambah_wisata', function () {
    return view('tambah_wisata');
})->middleware('auth');

Route::get('/request_guide', function () {
    return view('request_guide');
})->middleware('auth');

Route::get('/daftar_guide', function () {
    return view('daftar_guide');
})->middleware('auth');

Route::get('/Edit_Akun', function () {
    return view('Edit_Akun');
})->middleware('auth');