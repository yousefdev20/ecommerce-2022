<?php

namespace Database\Seeders;

use App\Models\Country;
use Illuminate\Database\Seeder;

class CountriesSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Country::query()->updateOrInsert(['name_en' => 'JORDAN'],
            ['name_en' => 'JORDAN', 'name_ar' => 'JORDAN', 'code_en' => 'JORDAN', 'code_ar' => 'JORDAN']
        );
    }
}
