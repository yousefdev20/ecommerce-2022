<?php

namespace App\Http\Controllers\Product;

use App\Models\Product\Color;
use App\Repositories\Colors\ColorsInterface;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreColorRequest;
use App\Http\Requests\UpdateColorRequest;

class ColorsController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:delete_color')->only('destroy');
        $this->middleware('permission:edit_color|show_color')->only(['update']);
    }

    /**
     * Display a listing of the resource.
     *
     * @param ColorsInterface $colors
     * @return JsonResponse
     */
    public function index(ColorsInterface $colors): JsonResponse
    {
        return $this->response($colors->get());
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
     * @param UpdateColorRequest $request
     * @param Color $color
     * @return JsonResponse
     */
    public function update(UpdateColorRequest $request, Color $color): JsonResponse
    {
        return $this->response($color->update($request->validated()));
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
