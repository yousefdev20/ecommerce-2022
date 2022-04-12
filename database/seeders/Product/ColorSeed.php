<?php

namespace Database\Seeders\Product;

use App\Models\Product\Color;
use Illuminate\Database\Seeder;

class ColorSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Color::query()->updateOrInsert(
            ['name_en' => 'red'],
            ['name_en' => 'red', 'name_ar' => 'احمر', 'code' => '123']
        );
    }
}
