<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\CountryController;
use App\Http\Controllers\Deal\DealController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Order\OrdersController;
use App\Http\Controllers\Product\ColorsController;
use App\Http\Controllers\Auth\Admin\LoginController;
use App\Http\Controllers\Order\WorkflowsController;
use App\Http\Controllers\Product\ProductsController;
use App\Http\Controllers\Category\CategoriesController;
use App\Http\Controllers\Currency\CurrenciesController;
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

Route::post('login', [LoginController::class, 'login']);

Route::group(['middleware' => ['auth:admin']], function () {

    Route::resource('products', ProductsController::class);
    Route::get('/products/search/{search}', [ProductsController::class, 'search']);

    Route::resource('colors', ColorsController::class);

    Route::resource('orders', OrdersController::class);
    Route::get('orders/details/{order}', [OrdersController::class, 'orderDetails']);

    Route::resource('deals', DealController::class);

    Route::resource('categories', CategoriesController::class);

    Route::resource('admins', AdminController::class);

    Route::resource('currencies', CurrenciesController::class);

    Route::resource('users', UsersController::class);
    Route::put('users/unblock/{user}', [UsersController::class, 'unblock']);

    Route::resource('countries', CountryController::class);

    Route::resource('workflows', WorkflowsController::class);

    Route::resource('exclusives', ExclusiveProductController::class);
});
