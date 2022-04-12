<?php

namespace App\Http\Controllers\Product;

use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Models\Product\ExclusiveProduct;
use App\Http\Requests\StoreExclusiveProductRequest;
use App\Http\Requests\UpdateExclusiveProductRequest;
use Illuminate\Support\Facades\Auth;

class ExclusiveProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        if (Auth::guard('admin')->user() ?? false) {
            return $this->response(ExclusiveProduct::query()->whereHas('product')->get());
        }
        return $this->response(ExclusiveProduct::query()->active()->whereHas('product')->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreExclusiveProductRequest $request
     * @return JsonResponse
     */
    public function store(StoreExclusiveProductRequest $request): JsonResponse
    {
        return $this->response(ExclusiveProduct::query()->create($request->validated()));
    }

    /**
     * Display the specified resource.
     *
     * @param ExclusiveProduct $exclusiveProduct
     * @return JsonResponse
     */
    public function show(ExclusiveProduct $exclusiveProduct, $id): JsonResponse
    {
        return $this->response(ExclusiveProduct::query()->find($id));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateExclusiveProductRequest $request
     * @param ExclusiveProduct $exclusiveProduct
     * @return JsonResponse
     */
    public function update(UpdateExclusiveProductRequest $request, $id, ExclusiveProduct $exclusiveProduct): JsonResponse
    {
        return $this->response(ExclusiveProduct::query()->find($id)->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param ExclusiveProduct $exclusiveProduct
     * @return JsonResponse
     */
    public function destroy(ExclusiveProduct $exclusiveProduct, $id): JsonResponse
    {
        return $this->response(ExclusiveProduct::query()->find($id)->delete());
    }
}
