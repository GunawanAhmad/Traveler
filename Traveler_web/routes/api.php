<?php

use App\Http\Controllers\API\CustomerController;
use App\Http\Controllers\API\GuideController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::group(['middleware' => ['auth:customer']], function () {
// });


//customer
Route::post('login/customer', [CustomerController::class, 'login'])->name('customer.login');
Route::post('register/customer', [CustomerController::class, 'register']);


//guide
Route::post('login/guide', [GuideController::class, 'login'])->name('guide.login');
Route::post('register/guide', [GuideController::class, 'register']);