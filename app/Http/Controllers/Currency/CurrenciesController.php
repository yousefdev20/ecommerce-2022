<?php

namespace App\Http\Controllers\Currency;

use App\Models\Currency\Currency;
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
        return $this->response($currency::query()->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Currency $currency
     * @return JsonResponse
     */
    public function destroy(Currency $currency): JsonResponse
    {
        return $this->response($currency->delete());
    }
}
