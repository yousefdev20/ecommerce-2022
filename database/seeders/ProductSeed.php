<?php

namespace Database\Seeders;

use App\Models\Product\Product;
use Illuminate\Database\Seeder;

class ProductSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i<=1000; $i++) {
            Product::query()->create(['name_ar' => 'test', 'name_en' => 'test', 'regular_price' => 10, 'sale_price' => 9,
                'quantity' => 10, 'image' => 'http://127.0.0.1:83/storage/media/2022-04-08/BTemBilaxkYyLwaYRXCXNyx7ifyrGH9VhAJWxb1A.png',
                'currency_id' => 1, 'category_id' => 1,
                'product_description_id' => 1]);
        }
    }
}
