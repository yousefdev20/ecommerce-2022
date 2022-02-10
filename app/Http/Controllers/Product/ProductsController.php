<?php

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Models\Product\Product;
use App\Models\Product\ProductDescription;
use Illuminate\Http\JsonResponse;

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
        return $this->response($request->validated());
        $product = ProductDescription::query()->create($request->only(['description_ar', 'description_en']))
            ->product()->create($request->except(['description_ar', 'description_en']));
        (!$request->sizes) ?: $product->sizes()->create();
        (!$request->colors) ?: $product->colors()->create(['size' => 'LG']);
        (!$request->images) ?: $product->images()->create(['size' => 'LG']);
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
}
