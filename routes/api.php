<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\CountryController;
use App\Http\Controllers\Cart\CartController;
use App\Http\Controllers\Deal\DealController;
use App\Http\Controllers\Order\OrdersController;
use App\Http\Controllers\Product\ColorsController;
use App\Http\Controllers\ProductFavoriteController;
use App\Http\Controllers\Auth\User\LoginController;
use App\Http\Controllers\Product\ProductsController;
use App\Http\Controllers\Auth\User\RegisterController;
use \App\Http\Controllers\Accounts\AccountsController;
use App\Http\Controllers\Category\CategoriesController;
use App\Http\Controllers\Currency\CurrenciesController;
use App\Http\Controllers\ContactUs\ContactUsController;
use App\Http\Controllers\Product\ProductReviewController;
use App\Http\Controllers\Product\ExclusiveProductController;
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

// Authentication service (login, registration)
Route::group(['prefix' => 'user'], function() {

    Route::post('login', [LoginController::class, 'login']);
    Route::post('register', [RegisterController::class, 'register']);
});

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::resource('invoices', InvoiceController::class)
        ->names(['show' => 'invoices.show'])
        ->only(['show']);

    Route::group(['prefix' => 'user'], function () {
        Route::get('product/favorite/{product}', [ProductFavoriteController::class, 'update']);
        Route::get('product/favorites', [ProductFavoriteController::class, 'index']);
        Route::get('orders', [OrdersController::class, 'userOrder']);
        Route::get('{user}', [AccountsController::class, 'show']);
        Route::put('{user}', [UsersController::class, 'update']);
        Route::put('update/password/{user}', [AccountsController::class, 'changeUserPassword']);
    });

    Route::get('order/details/{order}', [OrdersController::class, 'details']);
    Route::get('orders/{order}', [OrdersController::class, 'show'])->name('orders.show');
});

Route::get('user/order/tracking/{order}/{email}', [OrdersController::class, 'orderTracking']);

Route::post('orders', [OrdersController::class, 'store']);

Route::resource('products', ProductsController::class)
    ->names(['show' => 'products.show', 'index' => 'products.index'])
    ->only('show', 'index');

Route::group(['prefix' => 'products'], function () {
    Route::get('categories/filter', [ProductsController::class, 'getProducts']);
    Route::get('latest/{count}', [ProductsController::class, 'latestProduct']);
    Route::get('top/selling', [ProductsController::class, 'topSelling']);
    Route::get('home/slider', [ProductsController::class, 'slider']);
    Route::get('{search}/{page}', [ProductsController::class, 'search']);
    Route::post('review/{product}', [ProductReviewController::class, 'store']);
});

Route::resource('deals', DealController::class)
    ->names([ 'show' => 'deals.show'])
    ->only('show');

Route::get('deals/week/product', [DealController::class, 'dealForThisWeek']);

Route::resource('currencies', CurrenciesController::class)
    ->names(['index' => 'currencies.index', 'show' => 'currencies.show'])
    ->only('show', 'index');

Route::resource('categories', CategoriesController::class)
    ->names(['index' => 'categories.index', 'show' => 'categories.show'])
    ->only('show', 'index');
Route::get('categories/top/selling', [CategoriesController::class, 'topSelling']);

Route::resource('countries', CountryController::class)
    ->names(['index' => 'countries.index', 'show' => 'countries.show'])
    ->only('index', 'show');

Route::resource('colors', ColorsController::class)
    ->names(['index' => 'colors.index', 'show' => 'colors.show'])
    ->only('show', 'index');

Route::get('sizes', [ProductsController::class, 'sizes']);

Route::resource('contactus', ContactUsController::class)
    ->names(['store' => 'contactus.store'])
    ->only('store');

Route::get('deals/latest/product', [DealController::class, 'latestDealProduct']);

Route::post('cart', [CartController::class, 'loadCart']);

Route::get('exclusives', [ExclusiveProductController::class, 'index']);
