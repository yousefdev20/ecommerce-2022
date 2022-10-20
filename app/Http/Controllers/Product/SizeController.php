<?php

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSizeRequest;
use App\Http\Requests\UpdateSizeRequest;
use App\Models\Product\Size;
use App\Repositories\Sizes\SizesInterface;
use Illuminate\Http\JsonResponse;

class SizeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param SizesInterface $sizes
     * @return JsonResponse
     */
    public function index(SizesInterface $sizes): JsonResponse
    {
        return $this->response($sizes->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreSizeRequest $request
     * @return JsonResponse
     */
    public function store(StoreSizeRequest $request): JsonResponse
    {
        return $this->response($request->validated());
    }

    /**
     * Display the specified resource.
     *
     * @param Size  $size
     * @return JsonResponse
     */
    public function show(Size $size): JsonResponse
    {
        return $this->response($size);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateSizeRequest $request
     * @param Size $size
     * @return JsonResponse
     */
    public function update(UpdateSizeRequest $request, Size $size): JsonResponse
    {
        return $this->response($size->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Size $size
     * @return JsonResponse
     */
    public function destroy(Size $size): JsonResponse
    {
        return $this->response($size->delete());
    }
}
