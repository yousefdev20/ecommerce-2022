<?php

namespace Database\Seeders;

use App\Models\Deal\Deal;
use Illuminate\Database\Seeder;

class DealSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Deal::query()->create(['expiration_date' => now()->addYear()])
            ->products()->sync([1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
    }
}
