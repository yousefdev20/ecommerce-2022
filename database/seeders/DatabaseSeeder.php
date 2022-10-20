<?php

namespace Database\Seeders;

use Database\Seeders\Product\CategorySeed;
use Database\Seeders\Product\ColorSeed;
use Database\Seeders\Product\CurrencySeed;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            ColorSeed::class, SizesSeed::class, CurrencySeed::class, CategorySeed::class, AdminSeed::class, DealSeeder::class,
            CountriesSeed::class, LanguageSeeder::class
        ]);
    }
}
