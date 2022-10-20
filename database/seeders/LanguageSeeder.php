<?php

namespace Database\Seeders;

use App\Models\Language;
use Illuminate\Database\Seeder;

class LanguageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        Language::query()->insert([
            ['name' => 'english', 'code' => 'en', 'flag' => 'test'],
            ['name' => 'arabic', 'code' => 'ar', 'flag' => 'test']
        ]);
    }
}
