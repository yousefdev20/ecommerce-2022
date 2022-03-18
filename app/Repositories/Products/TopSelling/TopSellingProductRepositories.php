<?php

namespace App\Repositories\Products\TopSelling;

use App\Models\Product\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class TopSellingProductRepositories implements TopSellingProductInterface
{

    public function get()
    {
        return Cache::rememberForever('top_selling_product', function () {
            return $this->query();
        });
    }

    public function store()
    {
        Cache::rememberForever('top_selling_product', function () {
            return $this->query();
        });
    }

    public function delete()
    {
        Cache::forget('top_selling_product');
    }

    public function refresh()
    {
        $this->delete();
        $this->store();
    }

    private function query(): \Illuminate\Database\Eloquent\Model|\Illuminate\Database\Eloquent\Collection|\Illuminate\Database\Eloquent\Builder|array|null
    {
        $data = DB::table('order_product')
            ->selectRaw('count(product_id) as num_of_repeat, product_id')
            ->groupBy(['product_id'])
            ->orderByDesc('num_of_repeat')
            ->limit(8)
            ->get()->toArray();
        $ids = array_values(array_column($data, 'product_id'));
        return Product::query()->find($ids);
    }
}
