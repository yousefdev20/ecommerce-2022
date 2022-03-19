<?php

namespace App\Http\Controllers\Category;

use App\Models\Product\Category;
use App\Repositories\Products\TopSelling\TopSellingProductInterface;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreCategoryRequest;
use App\Http\Requests\UpdateCategoryRequest;
use App\Repositories\Category\CategoriesRepositoryInterface;
use Illuminate\Support\Facades\DB;

class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(CategoriesRepositoryInterface $categoriesRepository): JsonResponse
    {
        return $this->response($categoriesRepository->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreCategoryRequest $request
     * @return JsonResponse
     */
    public function store(StoreCategoryRequest $request): JsonResponse
    {
        $path = $request->file('image')->store('public/categories/' . date('Y-m-d'));
        return $this->response(Category::query()->create($request->except('image') + ['image' => $path]));
    }

    /**
     * Display the specified resource.
     *
     * @param Category $category
     * @return JsonResponse
     */
    public function show(Category $category): JsonResponse
    {
        return $this->response($category);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateCategoryRequest  $request
     * @param  Category  $category
     * @return JsonResponse
     */
    public function update(UpdateCategoryRequest $request, Category $category): JsonResponse
    {
        return $this->response($category->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Category  $category
     * @return JsonResponse
     */
    public function destroy(Category $category): JsonResponse
    {
        if ($category->loadCount('products') > 0){

            return $this->response([], 'this object has relationship', 422);
        }
        return $this->response($category->delete());
    }

    /**
     * @param CategoriesRepositoryInterface $categories
     * @return JsonResponse
     */
    public function topSelling(CategoriesRepositoryInterface $categories): JsonResponse
    {
        return $this->response($categories->topSelling());
    }
}
