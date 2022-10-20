<?php

namespace App\Http\Controllers\Category;

use App\Models\Product\Category;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreCategoryRequest;
use App\Http\Requests\UpdateCategoryRequest;
use App\Repositories\Category\CategoriesRepositoryInterface;

class CategoriesController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:delete_category')->only('destroy');
        $this->middleware('permission:edit_category')->only('update');
        $this->middleware('permission:show_category')->only('show');
    }

    /**
     * Display a listing of the resource.
     *
     * @param CategoriesRepositoryInterface $categoriesRepository
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
        $data = [$request->except(['image'])];
        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('public/categories/' . date('Y-m-d'));
            $data[0]['image'] = $path;
        }
        return $this->response($category->update($data[0]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return JsonResponse
     */
    public function destroy(int $id): JsonResponse
    {
        if (!Category::query()->hasProducts()->find($id)) {
            return $this->response(Category::query()->find($id)->delete());
        }
        return $this->response(['data' => 'this category has product, you cant delete it.'], null, 422);
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
