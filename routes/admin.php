<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\MediaController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\CountryController;
use App\Http\Controllers\InvoiceController;
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
Route::get('products/units', [ProductsController::class, 'units']);


Route::post('login', [LoginController::class, 'login']);

Route::group(['middleware' => ['auth:admin']], function () {

    Route::resource('products', ProductsController::class)
        ->names(['index' => 'products.admin.index', 'show' => 'products.admin.show', 'update' => 'products.admin.update',
            'store' => 'products.admin.store', 'destroy' => 'products.admin.destroy']);

    Route::group(['prefix' => 'products'], function () {
        Route::get('search/{search}', [ProductsController::class, 'search']);
        Route::post('upload/csv', [ProductsController::class, 'uploadCSVFile']);
        Route::get('units', [ProductsController::class, 'units']);
        Route::get('scale/sizes', [ProductsController::class, 'sizes']);
    });
    Route::/*middleware(['role:store_manager'])->*/resource('media', MediaController::class);

    Route::resource('colors', ColorsController::class)
        ->names(['index' => 'colors.admin.index', 'show' => 'colors.admin.show', 'update' => 'colors.admin.update',
            'store' => 'colors.admin.store', 'destroy' => 'colors.admin.destroy']);

    Route::resource('orders', OrdersController::class)
        ->names(['index' => 'orders.admin.index', 'show' => 'orders.admin.show', 'update' => 'orders.admin.update',
            'store' => 'orders.admin.store', 'destroy' => 'orders.admin.destroy']);

    Route::resource('invoices', InvoiceController::class)
        ->names(['index' => 'invoice.admin.index', 'show' => 'invoice.admin.show']);

    Route::get('orders/details/{order}', [OrdersController::class, 'orderDetails']);
    Route::get('orders/load/status', [OrdersController::class, 'status']);

    Route::resource('deals', DealController::class)
        ->names(['index' => 'deals.admin.index', 'show' => 'deals.admin.show', 'update' => 'deals.admin.update',
            'store' => 'deals.admin.store', 'destroy' => 'deals.admin.destroy']);

    Route::resource('categories', CategoriesController::class)
        ->names(['index' => 'categories.admin.index', 'show' => 'categories.admin.show', 'update' => 'categories.admin.update',
            'store' => 'categories.admin.store', 'destroy' => 'categories.admin.destroy']);

    Route::resource('admins', AdminController::class)
        ->names(['index' => 'admins.admin.index', 'show' => 'admins.admin.show', 'update' => 'admins.admin.update',
            'store' => 'admins.admin.store', 'destroy' => 'admins.admin.destroy']);

    Route::resource('currencies', CurrenciesController::class)
        ->names(['index' => 'currencies.admin.index', 'show' => 'currencies.admin.show', 'update' => 'currencies.admin.update',
            'store' => 'currencies.admin.store', 'destroy' => 'currencies.admin.destroy']);

    Route::resource('users', UsersController::class)
        ->names(['index' => 'users.admin.index', 'show' => 'users.admin.show', 'update' => 'users.admin.update',
            'store' => 'users.admin.store', 'destroy' => 'users.admin.destroy']);
    Route::put('users/unblock/{user}', [UsersController::class, 'unblock']);

    Route::resource('countries', CountryController::class)
        ->names(['index' => 'countries.admin.index', 'show' => 'countries.admin.show', 'update' => 'countries.admin.update',
            'store' => 'countries.admin.store', 'destroy' => 'countries.admin.destroy']);

    Route::resource('workflows', WorkflowsController::class)
        ->names(['index' => 'workflows.admin.index', 'show' => 'workflows.admin.show', 'update' => 'workflows.admin.update',
            'store' => 'workflows.admin.store', 'destroy' => 'workflows.admin.destroy']);

    Route::resource('exclusives', ExclusiveProductController::class)
        ->names(['index' => 'exclusives.admin.index', 'show' => 'exclusives.admin.show', 'update' => 'exclusives.admin.update',
            'store' => 'exclusives.admin.store', 'destroy' => 'exclusives.admin.destroy']);

    Route::get('daily/report', [ReportController::class, 'index']);
    Route::get('danger/quantity/product', [ProductsController::class, 'dangerQuantityProduct']);
});
