<?php

namespace App\Http\Controllers\Deal;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreDealRequest;
use App\Http\Requests\UpdateDealRequest;
use App\Models\Deal\Deal;
use Illuminate\Http\JsonResponse;

class DealController extends Controller
{
    /**
     * Display a listing of the current active Deal.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Deal::query()->with(['products'])->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreDealRequest $request
     * @return JsonResponse
     */
    public function store(StoreDealRequest $request): JsonResponse
    {
        return $this->response(Deal::query()
            ->updateOrInsert(['expiration_date', $request->expiration_date], $request->validated())
        );
    }

    /**
     * Display the specified resource.
     *
     * @param Deal $deal
     * @return JsonResponse
     */
    public function show(Deal $deal): JsonResponse
    {
        return $this->response($deal->load(['latestDealProduct']));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateDealRequest $request
     * @param  Deal  $deal
     * @return JsonResponse
     */
    public function update(UpdateDealRequest $request, Deal $deal): JsonResponse
    {
        return $this->response(Deal::query()
            ->updateOrInsert(['expiration_date', $request->expiration_date], $request->validated())
        );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Deal $deal
     * @return JsonResponse
     */
    public function destroy(Deal $deal): JsonResponse
    {
        return $this->response($deal::query()->delete());
    }

    /**
     * Get the latest Deal Products from database storage.
     *
     * @return JsonResponse
     */
    public function latestDealProduct(): JsonResponse
    {
        return $this->response(Deal::query()->latest()?->with(['latestDealProduct' => function($query) {
                return $query->limit(8);
            }])->first() ?? []);
    }
}
