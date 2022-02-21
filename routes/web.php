<?php

use App\Models\Product\Product;
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
    return view('welcome');
});

Route::get('categories', function () {
    return view('welcome', ['data' => \App\Models\Product\Product::with(['currency', 'category'])->get()]);
    return view('welcome', ['data' => \App\Models\Product\Category::all()]);
});
