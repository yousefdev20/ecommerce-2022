<?php

namespace App\Http\Controllers\Order;

use App\Models\Order\Order;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Models\Order\BillingAddress;
use App\Http\Services\Facades\Cart\Cart;
use App\Http\Requests\StoreOrderRequest;
use App\Http\Requests\UpdateOrderRequest;

class OrdersController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->only('show');
        $this->middleware('permission:delete_order')->only('destroy');
        $this->middleware('permission:edit_order|show_order')->only(['update']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Order::query()->with(['products', 'invoice'])->simplePaginate(10));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreOrderRequest  $request
     * @return JsonResponse
     */
    public function store(StoreOrderRequest $request): JsonResponse
    {
        $count = Cart::amount($request?->order ?? []);
        $items = Cart::productOrderAttach($request?->order ?? []);
        $billing_id = BillingAddress::query()->updateOrCreate($request->only('billing')['billing'],
            $request->only(['billing'])['billing']);
        $order = Order::query()?->create(
            $request->only(['currency_id', 'user_id', 'coupon_id', 'note']) +
            [ 'amount' => $count, 'billing_address_id' => $billing_id?->id ?? 0]
        );
        $order->products()?->attach($items);
        return $this->response($order, 'success');
    }

    /**
     * Display the specified resource (user).
     *
     * @param Order $order
     * @return JsonResponse
     */
    public function show(Order $order): JsonResponse
    {
        return $this->response($order->load(['products']));
    }

    /**
     * @return JsonResponse
     */
    public function userOrder(): JsonResponse
    {
        return $this->response(auth()?->user()?->load('orders.invoice'));
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
        return $this->response($order->update($request->validated()));
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
            $order->load(['products' , 'shippingAddress', 'billingAddress', 'coupon', 'workflow'])
        );
    }

    /**
     * @param int $orderId
     * @param string $email
     * @return JsonResponse
     */
    public function orderTracking(string|int $order, string $email): JsonResponse
    {
        return $this->response(Order::query()
            ->whereHas('billingAddress', function ($query) use ($email) {
                $query->where('email', $email);
            })->with(['workflow'])->find($order));
    }

    /**
     * Display the specified resource (admin).
     *
     * @param Order $order
     * @return JsonResponse
     */
    public function orderDetails(Order $order): JsonResponse
    {
        return $this->response(
            $order->load(['coupon', 'shippingAddress', 'billingAddress', 'user', 'products'])
        );
    }

    /**
     * List of all order stats.
     *
     * @return JsonResponse
     */
    public function status(): JsonResponse
    {
        return $this->response(config('order.status'));
    }
}
