<?php

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductReviewRequest;
use App\Http\Requests\UpdateProductReviewRequest;
use App\Models\ProductReview;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Cache;

class ProductReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
//        return $this->response();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreProductReviewRequest $request
     * @return JsonResponse
     */
    public function store(StoreProductReviewRequest $request): JsonResponse
    {
        return $this->response(ProductReview::query()->create($request->validated()));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateProductReviewRequest $request
     * @param ProductReview $productReview
     * @return JsonResponse
     */
    public function update(UpdateProductReviewRequest $request, ProductReview $productReview): JsonResponse
    {
        return $this->response($productReview->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param ProductReview $productReview
     * @return JsonResponse
     */
    public function destroy(ProductReview $productReview): JsonResponse
    {
        return $this->response($productReview->delete());
    }
}
