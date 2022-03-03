<?php

namespace App\Http\Controllers;

use App\Models\Product\Product;
use Illuminate\Http\JsonResponse;
use App\Models\Product\ProductFavorite;

class ProductFavoriteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(auth()->user()->load(['favorites']));
    }

    /**
     *
     * Update function retrieve product it checks if product already stored on favorite
     * if the response was true it shall delete from favorite.
     *
     * @param Product $product
     * @return JsonResponse
     */
    public function update(Product $product): JsonResponse
    {
        $favoriteProduct = ProductFavorite::query();
        $columns = ['user_id' => auth()->id(), 'product_id'=> $product?->id];
        if ($favoriteProduct->where($columns)->exists()) {
            $favoriteProduct->delete();
        } else {
            $favoriteProduct->insert($columns);
        }
        return $this->response(true);
    }
}
