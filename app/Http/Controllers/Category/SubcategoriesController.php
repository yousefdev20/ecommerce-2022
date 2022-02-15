<?php

namespace App\Http\Controllers\Category;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSubCategoriesRequest;
use App\Models\Category\SubCategory;

class SubcategoriesController extends Controller
{
    public function index()
    {

    }

    public function show()
    {

    }

    public function store(StoreSubCategoriesRequest $request)
    {

        return $this->response(SubCategory::query()->create($request->validated()));
    }

    public function destroy(SubCategory $subCategory)
    {
        if ($subCategory->has(['products'])) {
            return $this->response([], 'this object has relationship', 422);
        }
        return $this->response($subCategory->delete());
    }

}
