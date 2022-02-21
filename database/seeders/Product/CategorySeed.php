<?php

namespace Database\Seeders\Product;

use App\Models\Product\Category;
use Illuminate\Database\Seeder;

class CategorySeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Category::query()->updateOrInsert(['name_en' => 'Computer'],
            ['name_en' => 'Computer', 'name_ar' => 'كمبيوتر', 'level' => 1]);
    }
}
