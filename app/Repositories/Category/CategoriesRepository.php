<?php

namespace App\Repositories\Category;

use App\Models\Product\Category;
use Illuminate\Support\Facades\DB;
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

    public function deleteTopSelling(): bool
    {
        return Cache::forget('top_selling_categories');
    }

    public function refresh()
    {
        $this->delete();
        $this->store();
    }

    public function refreshTopSelling()
    {
        $this->deleteTopSelling();
        $this->topSelling();
    }

    public function topSelling(): \Illuminate\Database\Eloquent\Model|\Illuminate\Database\Eloquent\Collection|\Illuminate\Database\Eloquent\Builder|array|null
    {
        $ids = Cache::rememberForever('top_selling_categories', function () {
            return $this->ids();
        });
        return Category::query()->find($ids);
    }

    public function ids(): array
    {
        $data = DB::table('order_product')
            ->join('products', 'products.id', '=', 'order_product.product_id')
            ->selectRaw('count(products.category_id) as num_of_repeat, products.category_id as id')
            ->groupBy(['category_id'])
            ->orderByDesc('num_of_repeat')
            ->limit(8)
            ->get()->toArray();
        return array_values(array_column($data, 'id'));
    }

    public function find(?string $name)
    {
        // TODO: Implement find() method.
    }

    public function where(string $column = 'id', $value)
    {
        return collect($this->get())->where($column, $value)->first();
    }
}
