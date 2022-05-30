<?php

namespace App\Http\Controllers\Deal;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreDealRequest;
use App\Http\Requests\UpdateDealRequest;
use App\Models\Deal\Deal;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class DealController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:delete_deal')->only('destroy');
        $this->middleware('permission:edit_deal')->only(['update']);
    }

    /**
     * Display a listing of the current active Deal.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Deal::query()->get());
    }

    public function dealForThisWeek(): JsonResponse
    {
        return $this->response(Deal::query()->thisWeek()->with(['products' => function($query) {
            return $query->inStock()->limit(8);
        }])->first());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreDealRequest $request
     * @return JsonResponse
     */
    public function store(StoreDealRequest $request): JsonResponse
    {
        return $this->response(
            Deal::create($request->only('expiration_date'))
                ->products()->sync((array_values($request->product_id ?? [])))
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
        return $this->response($deal?->load(['products' => function($query) {
            return $query->inStock()->get();
        }]));
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
        DB::transaction(function () use ($deal, $request) {
            $deal->update($request->only('expiration_date'));
            $deal->products()->detach();
            $deal->products()->sync((array_values($request->product_id ?? [])));

        });
        return $this->response($deal);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Deal $deal
     * @return JsonResponse
     */
    public function destroy(Deal $deal): JsonResponse
    {
        return $this->response($deal->delete());
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
