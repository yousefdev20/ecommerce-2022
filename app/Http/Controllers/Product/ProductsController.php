<?php

namespace App\Http\Controllers\Product;

use App\Models\Product\Product;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Product\ProductDescription;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Product::query()->with(['currency'])->simplePaginate(9));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreProductRequest  $request
     * @return JsonResponse
     */
    public function store(StoreProductRequest $request): JsonResponse
    {
//        return $this->response($request->validated();
//        $product = ProductDescription::query()->create($request->only(['description_ar', 'description_en']))
//            ->product()->create($request->except(['description_ar', 'description_en']));
//        (!$request->sizes) ?: $product->sizes()->create();
//        (!$request->colors) ?: $product->colors()->create(['size' => 'LG']);
//        (!$request->images) ?: $product->images()->create(['size' => 'LG']);
        return $this->response(
            ProductDescription::query()->create($request->only(['description_ar', 'description_en']))
                ->product()->create($request->except(['description_ar', 'description_en']))
//            ->sizes()->create(['size' => 'LG'])
//            ->colors()->create(['size' => 'LG'])
//            ->images()->create(['size' => 'LG'])
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  Product  $product
     * @return JsonResponse
     */
    public function show(Product $product): JsonResponse
    {
        return $this->response(
            $product->load(['sizes', 'images', 'colors', 'description', 'category', 'currency'])
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateProductRequest  $request
     * @param  Product  $product
     * @return JsonResponse
     */
    public function update(UpdateProductRequest $request, Product $product): JsonResponse
    {
        $product->updateOrFail([]);
        $product->colors()->updateOrFail([]);
        $product->images()->updateOrFail([]);
        $product->description()->updateOrFail([]);
        $product->sizes()->updateOrFail([]);

        return $this->response($product);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Product  $product
     * @return JsonResponse
     */
    public function destroy(Product $product): JsonResponse
    {
        return $this->response($product->delete());
    }

    /**
     * get the latest (8) product from storage.
     *
     * @return JsonResponse
     */
    public function latestProduct(int $count = 8): JsonResponse
    {
        return $this->response(Product::query()->latest()->with(['currency'])->limit($count)->get());
    }

    /**
     * get the latest (8) product from storage.
     *
     * @return JsonResponse
     */
    public function bestSelling(int $count = 8): JsonResponse
    {
        $products = DB::table('order_product')
            ->select(DB::raw('count(product_id) as count', 'product_id'))->get();
        return $this->response($products);
    }

    /**
     * Load Products Base on Filter (Category, Color, Price)
     *
     * @param Request
     * @return JsonResponse
     */
    public function getProducts(Request $request): JsonResponse
    {
        $products = Product::query();

        # Category
        if ($request->category) {
            $products->with(['currency'])->whereHas('category', function ($query) use ($request) {
                $query->where('id', $request->category);
            });
        }
        # Colors
        if ($request->color) {
            $products->with(['colors'])->whereHas('colors', function ($query) use ($request) {
                $query->where('color_id', $request->color);
            });
        }
        # Price [from-to]
        if ($request->price) {
            $products->where([['sale_price', '>=', $request->price->from], ['sale_price', '<=', $request->price->to]]);
        }
        return $this->response($products->simplePaginate(9));
    }
}
