<?php

namespace Database\Seeders\Product;

use App\Models\Currency\Currency;
use Illuminate\Database\Seeder;

class CurrencySeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Currency::query()->updateOrInsert(['name_en' => 'Jordan'],
            [
                'name_en' => 'Jordan', 'name_ar' => 'الاردن',
                'code_en' => 'JOD', 'code_ar' => 'د.ا',
                'exchange' => 0.72
            ]);
    }
}
