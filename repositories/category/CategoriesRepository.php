<?php

namespace Repositories\Category;

use App\Models\Product\Category;
use Illuminate\Support\Facades\Cache;

class CategoriesRepository implements CategoriesRepositoryInterface
{

    public function get()
    {
        return Cache::get('categories', function () {

            return Category::all();
        });
    }

    public function store()
    {
        return Cache::store('categories', Category::all());
    }
}
