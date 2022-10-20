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
    return config('app.name');
});

Route::get('categories', function () {
    $data = \App\Models\Order\Order::query()->with(['coupon', 'shippingAddress', 'billingAddress', 'user', 'products' => function ($query) {
        return $query->groupBy(['products.id', 'order_product.size_id', 'order_product.color_id'])
            ->selectRaw('products.*, count(products.id) as count, sum(products.sale_price) as sum_sale_price,
                     color_id, size_id, colors.id as color_relation_id, colors.name_en as color_name_en,
                     colors.name_ar as color_name_ar')
            ->join('colors', 'order_product.color_id', '=', 'colors.id')
            ->get();
    }])->get();
    $product = Product::all();
    return view('welcome', ['data' => $data])->with('data', $data);
//    return view('welcome', ['data' => \App\Models\Product\Product::with(['currency', 'category'])->get()]);
//    return view('welcome', ['data' => \App\Models\Product\Category::all()]);
});

Route::get('/generate/routes', function() {

header('Content-Type: application/excel');
    header('Content-Disposition: attachment; filename="routes.csv"');
 
    $routes = Route::getRoutes();
    $fp = fopen('php://output', 'w');
    fputcsv($fp, ['METHOD', 'URI', 'NAME', 'ACTION']);
    foreach ($routes as $route) {
        fputcsv($fp, [head($route->methods()) , $route->uri(), $route->getName(), $route->getActionName()]);
    }
    fclose($fp);

});
