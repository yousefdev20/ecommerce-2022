<?php

namespace App\Http\Controllers\Currency;

use App\Models\Currency\Currency;
use App\Models\Product\Category;
use App\Repositories\Currencies\CurrencyInterface;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreCurrencyRequest;
use App\Http\Requests\UpdateCurrencyRequest;

class CurrenciesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param CurrencyInterface $currency
     * @return JsonResponse
     */
    public function index(CurrencyInterface $currency): JsonResponse
    {
        return $this->response($currency->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreCurrencyRequest  $request
     * @return JsonResponse
     */
    public function store(StoreCurrencyRequest $request): JsonResponse
    {
        return $this->response(Currency::query()->create($request->validated()));
    }

    /**
     * Display the specified resource.
     *
     * @param Currency $currency
     * @return JsonResponse
     */
    public function show(Currency $currency): JsonResponse
    {
        return $this->response($currency);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateCurrencyRequest $request
     * @param Currency $currency
     * @return JsonResponse
     */
    public function update(UpdateCurrencyRequest $request, Currency $currency): JsonResponse
    {
        return $this->response($currency->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return JsonResponse
     */
    public function destroy(int $id): JsonResponse
    {
        if (!Currency::query()->hasProducts()->find($id)) {
            return $this->response(Currency::query()->hasProducts()->find($id)->delete());
        }
        return $this->response(['data' => 'this currency may has products, you cant delete it.'], null, 422);
    }
}
