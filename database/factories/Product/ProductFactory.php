<?php

namespace Database\Factories\Product;

use Faker\Generator;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $product = new Generator();
        $min = rand(2, 100);
        return [
            'name_ar' => Str::random(10),
            'name_en' => Str::random(10),
            'regular_price' => $min,
            'sale_price' => $min - 1,
            'quantity' => $min,
            'image' => Str::random(10),
            'currency_id' => 1,
            'category_id' => 1,
            'description_id' => 1
        ];
    }
}
