<?php

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductFavoriteRequest;
use App\Http\Requests\UpdateProductFavoriteRequest;
use App\Models\Product\ProductFavorite;
use Illuminate\Http\JsonResponse;

class ProductFavoriteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(ProductFavorite::query()->simplePaginate(10));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreProductFavoriteRequest  $request
     * @return JsonResponse
     */
    public function store(StoreProductFavoriteRequest $request): JsonResponse
    {
        return $this->response(auth()->user()->favorites()->insert(['product_id' => $request->product_id]));
    }

    /**
     * Display the specified resource.
     *
     * @param ProductFavorite $productFavorite
     * @return JsonResponse
     */
    public function show(ProductFavorite $productFavorite): JsonResponse
    {
        return $this->response($productFavorite->load(['product']));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateProductFavoriteRequest $request
     * @param ProductFavorite $productFavorite
     */
    public function update(UpdateProductFavoriteRequest $request, ProductFavorite $productFavorite)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param ProductFavorite $productFavorite
     * @return JsonResponse
     */
    public function destroy(ProductFavorite $productFavorite): JsonResponse
    {
        return $this->response($productFavorite->delete());
    }
}
