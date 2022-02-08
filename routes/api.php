<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Product\ProductsController;
use App\Http\Controllers\Product\ProductColorsController;

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

Route::group(['middleware' => []], function () {

    Route::resource('products', ProductsController::class)->only('show', 'index');

    Route::resource('orders', ProductsController::class)->only('store', 'show');
});
