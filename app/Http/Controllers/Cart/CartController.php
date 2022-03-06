<?php

namespace App\Http\Controllers\Cart;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoadCartRequest;
use App\Models\Product\Product;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class CartController extends Controller
{
    /**
     * @param LoadCartRequest $request
     * @return JsonResponse
     * @throws \Laravel\Octane\Exceptions\DdException
     */
    public function loadCart(LoadCartRequest $request): JsonResponse
    {
        $products = Product::query()
            ->select(['id', 'name_ar', 'name_en', 'sale_price', 'image'])
            ->find(array_column($request?->cart['products'], 'id'));
        $totalPrice = 0;
        foreach ($products as $key => $value) {
            $quantity = $this->getProductQuantityFromRequest($request, $value->id);
            $products[$key]['total_price'] = $value->sale_price * $quantity;
            $products[$key]['qun'] = $quantity;
            $totalPrice += $value->sale_price * $quantity;
        }
        return $this->response([
            'products' => $products, 'total_price' => $totalPrice,
            'currency_code' => $request?->header('currency_code') ?? ''
        ]);
    }

    private function getProductQuantityFromRequest(LoadCartRequest $request, int $id = 0): int
    {
        foreach ($request?->cart['products'] ?? [] as $value) {
            if ($value['id'] == $id) {
                return $value['qun'];
            }
        }
        return 1;
    }
}
