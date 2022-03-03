<?php

namespace Database\Seeders;

use App\Models\Admin\Admin;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;

class AdminSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Admin::query()->updateOrInsert(['name' => 'admin'],
            ['name' => 'admin', 'email' => 'admin@admin.com', 'password' => Hash::make('admin')]
        );
    }
}
