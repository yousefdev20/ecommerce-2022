<?php

namespace App\Repositories\Category;

use App\Models\Product\Category;
use App\Repositories\IStorable;
use Illuminate\Support\Facades\Cache;

class CategoriesRepository implements CategoriesRepositoryInterface
{
    public function get()
    {
        return Cache::rememberForever('categories', function () {
            return Category::doseNotHaveParent()->get();
        });
    }

    public function store()
    {
        Cache::rememberForever('categories',  function () {
            return Category::doseNotHaveParent()->get();
        });
    }

    public function delete(): bool
    {
        return Cache::forget('categories');
    }

    public function refresh()
    {
        $this->delete();
        $this->store();
    }
}
