<?php

namespace App\Http\Controllers\Order;

use App\Http\Services\Cart;
use App\Models\Order\BillingAddress;
use App\Models\Order\Order;
use App\Models\Product\Product;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreOrderRequest;
use App\Http\Requests\UpdateOrderRequest;
use Illuminate\Support\Facades\DB;

class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Order::query()->with(['products'])->simplePaginate(10));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreOrderRequest  $request
     * @return JsonResponse
     */
    public function store(StoreOrderRequest $request): JsonResponse
    {
        $billing_id = null;
        DB::transaction(function () use ($request) {
            $ids = ($request->order['products']);
            $billing_id = BillingAddress::query()->insertGetId($request->only(['billing'])['billing']);
            Order::query()->create(
                $request->only(['currency_id', 'user_id', 'coupon_id', 'currency_id']) +
                        [ 'amount' => 10, 'billing_address_id' => $billing_id]
            )->products()->attach($ids);
        });
        return $this->response($billing_id, 'success');
    }

    /**
     * Display the specified resource.
     *
     * @param Order $order
     * @return JsonResponse
     */
    public function show(Order $order): JsonResponse
    {
        return $this->response(auth()->user()->load('orders', function ($query) use ($order) {
            return $query->where('id', $order->id);
        }));
    }

    public function userOrder()
    {
        return $this->response(auth()->user()->load('orders'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateOrderRequest  $request
     * @param  Order  $order
     * @return JsonResponse
     */
    public function update(UpdateOrderRequest $request, Order $order): JsonResponse
    {
        return $this->response($order::query()->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Order  $order
     * @return JsonResponse
     */
    public function destroy(Order $order): JsonResponse
    {
        return $this->response($order->delete());
    }

    /**
     * Load order details with all relationship:
     * (['products', 'shippingAddress', 'billingAddress', 'coupon', 'workflow'])
     *
     * @param Order $order
     * @return JsonResponse
     */
    public function details(Order $order): JsonResponse
    {
        return $this->response(
            $order->load(['products', 'shippingAddress', 'billingAddress', 'coupon', 'workflow'])
        );
    }
}
