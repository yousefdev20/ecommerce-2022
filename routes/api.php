<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Cart\CartController;
use App\Http\Controllers\Deal\DealController;
use App\Http\Controllers\Order\OrdersController;
use App\Http\Controllers\Product\ColorsController;
use App\Http\Controllers\Product\ProductsController;
use App\Http\Controllers\Category\CategoriesController;
use App\Http\Controllers\Currency\CurrenciesController;

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

Route::group(['middleware' => ['throttle:60']], function () {

    Route::resource('products', ProductsController::class)->only('show', 'index');
    Route::get('products/categories/filter', [ProductsController::class, 'getProducts']);
    Route::get('products/latest/{count}', [ProductsController::class, 'latestProduct']);

    Route::resource('orders', OrdersController::class)->only('store', 'show');

    Route::resource('deals', DealController::class)->only('show', 'index');

    Route::resource('currencies', CurrenciesController::class)->only('show', 'index');

    Route::resource('categories', CategoriesController::class)->only('show', 'index');

    Route::resource('colors', ColorsController::class)->only('show', 'index');

    Route::get('deals/latest/product', [DealController::class, 'latestDealProduct']);

    Route::post('cart', [CartController::class, 'loadCart']);
});
