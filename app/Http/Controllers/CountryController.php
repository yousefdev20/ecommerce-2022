<?php

namespace App\Http\Controllers;

use App\Models\Country;
use Illuminate\Http\JsonResponse;
use App\Http\Requests\StoreCountryRequest;
use App\Http\Requests\UpdateCountryRequest;
use App\Repositories\Countries\CountriesRepositoryInterface;

class CountryController extends Controller
{
    /**
     * @var CountriesRepositoryInterface
     */
    protected CountriesRepositoryInterface $counties;

    public function __construct(CountriesRepositoryInterface $counties)
    {
        $this->counties = $counties;
        $this->middleware('permission:add_country')->only(['store']);
        $this->middleware('permission:delete_country')->only(['destroy']);
        $this->middleware('permission:show_country|edit_country')->only(['show']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     *
     */
    public function index(): JsonResponse
    {
        return $this->response($this->counties->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreCountryRequest $request
     * @return JsonResponse
     */
    public function store(StoreCountryRequest $request): JsonResponse
    {
        return $this->response(Country::query()->create($request->validated()));
    }

    /**
     * Display the specified resource.
     *
     * @param Country $country
     * @return JsonResponse
     */
    public function show(Country $country): JsonResponse
    {
        return $this->response($country);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateCountryRequest $request
     * @param Country $country
     * @return JsonResponse
     */
    public function update(UpdateCountryRequest $request, Country $country): JsonResponse
    {
        return $this->response($country->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Country $country
     * @return JsonResponse
     */
    public function destroy(Country $country): JsonResponse
    {
        return $this->response($country->delete());
    }
}
