<?php

namespace App\Http\Services;

use App\Models\Product\Product;
use Illuminate\Support\Facades\DB;
use App\Repositories\Colors\Colors;

class Cart
{
    protected array $items = [];
    protected array $products = [];

    /**
     *
     * load all items with keep the data same just for check item is dirty or not.
     *
     * @param array $cart
     * @return array
     */
    public function all(array $cart): array
    {
        $totalPrice = 0;
        foreach ($cart ?? [] as $key => $item) {
            $itemClone = $this->getItem($item['id'] ?? 0) ?? [];
            $itemClone['size'] = $this->getSize($item['size']['size_id'] ?? 0);
            $itemClone['color'] = $this->getColor($item['color']['id'] ?? 0);
            $itemClone['qun'] = $item['qun'] ?? 0;
            $itemClone['total_price'] = round(($item['qun'] ?? 1) * ($itemClone['sale_price'] ?? 0), 2);
            $totalPrice += $itemClone['total_price'] ?? 0;
            $this->products[] = $itemClone;
        }
        return [
                'products' => $this->products,
                'total_price' => round($totalPrice, 2),
                'currency_code' => request()?->header('currency_code') ?? ''
            ] ?? [];
    }

    public function productOrderAttach(array $cart): \Illuminate\Support\Collection
    {
        $items = collect();
        foreach ($cart ?? [] as $item) {
            for ($i = 0; $i < $item['qun'] ?? 0; $i++) {
                $obj['product_id'] = $item['id'];
                $obj['size_id'] = $item['size']['size_id'] ?? null;
                $obj['color_id'] = $item['color']['id'] ?? null;
                $items->add($obj);
            }
        }
        return $items;
    }

    private function getColor(int $id)
    {
        return (new Colors())->where('id', $id ?? 0) ?? [];
    }

    private function getSize(int $id)
    {
        return collect(config('product.sizes'))->where('id', $id ?? 0)->first() ?? [];
    }

    private function getItem(int $id): \Illuminate\Database\Eloquent\Model|\Illuminate\Database\Eloquent\Collection|\Illuminate\Database\Eloquent\Builder|array|null
    {
        return Product::query()
            ->select(['id', 'name_ar', 'name_en', 'sale_price', 'image', 'currency_id', 'quantity'])
            ->find($id);
    }

    public function amount(array $cart): float|int
    {
        $totalPrice = 0;
        foreach ($cart ?? [] as $key => $item) {
            $itemClone = $this->getItem($item['id'] ?? 0) ?? [];
            $itemClone['total_price'] = round(($item['qun'] ?? 1) * ($itemClone->sale_price ?? 1), 2);
            $totalPrice += $itemClone['total_price'] ?? 0;
        }
        return $totalPrice;
    }
}
