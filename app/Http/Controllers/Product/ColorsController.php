<?php

namespace App\Http\Controllers\Product;

use App\Models\Product\Color;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreColorRequest;
use App\Http\Requests\UpdateColorRequest;

class ColorsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Color::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreColorRequest  $request
     * @return JsonResponse
     */
    public function store(StoreColorRequest $request): JsonResponse
    {
        return $this->response(Color::query()->create($request->validated()));
    }

    /**
     * Display the specified resource.
     *
     * @param  Color  $color
     * @return JsonResponse
     */
    public function show(Color $color): JsonResponse
    {
        return $this->response($color);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateColorRequest  $request
     * @param  Color  $color
     * @return JsonResponse
     */
    public function update(UpdateColorRequest $request, Color $color): JsonResponse
    {
        return $this->response($color::query()->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Color  $color
     * @return JsonResponse
     */
    public function destroy(Color $color): JsonResponse
    {
        return $this->response($color->delete());
    }
}
