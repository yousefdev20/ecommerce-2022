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
        return $this->response(auth()?->user()?->load('favorites.product'));
    }

    /**
     *
     * Update function retrieve product it checks if product already stored on favorite
     * if the response was true it shall delete from favorite.
     *
     * @param $productID
     * @return JsonResponse
     */
    public function update($productID): JsonResponse
    {
        $favoriteProduct = ProductFavorite::query()->where('user_id', auth()->id())
            ->where('product_id', $productID);
        if ($favoriteProduct->first() ?? false) {
            $favoriteProduct->delete();
        }else {
            ProductFavorite::query()->insert(['user_id'=> auth()->id(), 'product_id'=> $productID]);
        }
        return $this->response(true);
    }
}
