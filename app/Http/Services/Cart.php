<?php

namespace App\Http\Services;

use Illuminate\Support\Facades\DB;

class Cart
{
    private function getItem(int $id)
    {
        return DB::table('products')
            ->select(['id', 'name_ar', 'name_en', 'sale_price', 'image'])
        ->find($id);
    }

    public function load(array $cart): array
    {
        $products = [];
        foreach ($cart as $value) {
            $products[] = $this->getItem($value);
            $quantity = $this->itemQuantity($cart, $value);
            $products[]['total_price'] = 10 * $quantity;
            $products[]['quantity'] = $quantity;
        }
        return $products;
    }

    public function totalPrice(array $cart): float|int
    {
        $totalPrice = 0;
        foreach ($cart as $value) {
            $totalPrice += $this->itemTotalPrice($cart, $value);
        }
        return $totalPrice;
    }

    public function itemTotalPrice(array $cart, int $id): float|int
    {
        return $this->itemQuantity($cart, $id) *
            DB::table('products')
                ->where('id', $id)
                ->sum('sale_price');
    }

    protected function itemQuantity(array $cart, int $id): int
    {
        $quantity = 0;
        foreach ($cart ?? [] as $value) {
            if ($value == $id) {
                $quantity += 1;
            }
        }
        return $quantity;
    }
}
