<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CountryController;
use App\Http\Controllers\Cart\CartController;
use App\Http\Controllers\Deal\DealController;
use App\Http\Controllers\Order\OrdersController;
use App\Http\Controllers\Product\ColorsController;
use App\Http\Controllers\ProductFavoriteController;
use App\Http\Controllers\Auth\User\LoginController;
use App\Http\Controllers\Product\ProductsController;
use App\Http\Controllers\Auth\User\RegisterController;
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

    // Authentication service (login, registration)
    Route::group(['prefix' => 'user'], function() {

        Route::post('login', [LoginController::class, 'login']);
        Route::post('register', [RegisterController::class, 'register']);
    });

    Route::group(['middleware' => ['auth:sanctum']], function (){
        Route::get('user/product/favorite/{product}', [ProductFavoriteController::class, 'update']);
        Route::get('order/details/{order}', [OrdersController::class, 'details']);
        Route::get('user/orders', [OrdersController::class, 'userOrder']);
    });

    Route::resource('products', ProductsController::class)->only('show', 'index');
    Route::get('products/categories/filter', [ProductsController::class, 'getProducts']);
    Route::get('products/latest/{count}', [ProductsController::class, 'latestProduct']);

    Route::resource('orders', OrdersController::class)->only('store');

    Route::resource('deals', DealController::class)->only('show', 'index');

    Route::resource('currencies', CurrenciesController::class)->only('show', 'index');

    Route::resource('categories', CategoriesController::class)->only('show', 'index');

    Route::resource('countries', CountryController::class)->only('index', 'show');

    Route::resource('colors', ColorsController::class)->only('show', 'index');

    Route::get('deals/latest/product', [DealController::class, 'latestDealProduct']);

    Route::post('cart', [CartController::class, 'loadCart']);
});
