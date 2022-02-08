<?php

namespace App\Http\Controllers\Order;

use App\Models\Order\Order;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreOrderRequest;
use App\Http\Requests\UpdateOrderRequest;

class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Order::query()->simplePaginate(10));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreOrderRequest  $request
     * @return JsonResponse
     */
    public function store(StoreOrderRequest $request): JsonResponse
    {
        return $this->response(Order::query()->create($request->validated()));
    }

    /**
     * Display the specified resource.
     *
     * @param Order $order
     * @return JsonResponse
     */
    public function show(Order $order): JsonResponse
    {
        return $this->response($order);
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
}
