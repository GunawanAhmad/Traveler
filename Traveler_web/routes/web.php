<?php

use App\Http\Controllers\AdminAkunController;
use App\Http\Controllers\requestTourGuideController;
use App\Http\Controllers\DaftarWisataController;
use App\Http\Controllers\GuideController;
use App\Http\Controllers\LoginController;
use GuzzleHttp\Middleware;
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

Route::post('/logout', [LoginController::class, 'logout']);


Route::get('/daftar_wisata', [DaftarWisataController::class, 'index'])->middleware('auth');

Route::get('/edit_wisata/{id}', [DaftarWisataController::class, 'edit_wisata_view'])->middleware('auth');

Route::post('/edit_wisata/{id}', [DaftarWisataController::class, 'edit_wisata'])->middleware('auth');

Route::post('/tambah_wisata', [DaftarWisataController::class, 'store'])->middleware('auth');

Route::get('/tambah_wisata', [DaftarWisataController::class, 'tambah_wisata_view'])->middleware('auth');

Route::delete('/hapus_wisata', [DaftarWisataController::class, 'hapus_wisata'])->Middleware('auth');


Route::get('/request_guide', [requestTourGuideController::class, 'requestTourGuide'])->middleware('auth');

Route::get('/daftar_guide', [GuideController::class, 'index'])->middleware('auth');

Route::get('/daftar_guide/{id}', [GuideController::class, 'detail_guide'])->middleware('auth');

Route::post('/acc/{id}', [requestTourGuideController::class, 'acc'])->middleware('auth');
Route::post('/reject/{id}', [requestTourGuideController::class, 'reject'])->middleware('auth');


Route::get('/Edit_Akun', [AdminAkunController::class, 'edit_view'])->middleware('auth');

Route::post('/edit_akun', [AdminAkunController::class, 'edit_akun'])->middleware('auth');