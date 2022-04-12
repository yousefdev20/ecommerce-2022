<?php

namespace Database\Seeders;

use App\Models\Product\Size;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SizesSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Size::query()->delete();
        DB::select('ALTER TABLE sizes AUTO_INCREMENT = 1');
        foreach (config('product.sizes') as $size) {
            Size::query()->updateOrCreate(['name_en' => $size['name_en']], ['name_en' => $size['name_en']]);
        }
    }
}
