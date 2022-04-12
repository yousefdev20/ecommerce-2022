<?php

namespace App\Http\Controllers\Cart;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoadCartRequest;
use App\Http\Services\Facades\Cart\Cart;
use App\Models\Product\Product;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class CartController extends Controller
{
    /**
     * @param LoadCartRequest $request
     * @return JsonResponse
     */
    public function loadCart(LoadCartRequest $request): JsonResponse
    {
        return $this->response(Cart::all($request->cart['products'] ?? []));
    }
}
