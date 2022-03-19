<?php

namespace App\Console;

use App\Jobs\Categories\TopSellingCategoriesJob;
use App\Jobs\Products\TopSellingProductJob;
use App\Repositories\Category\CategoriesRepository;
use App\Repositories\Products\TopSelling\TopSellingProductRepositories;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Illuminate\Support\Facades\Log;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $topProducts = new TopSellingProductRepositories();
        $topCategories = new CategoriesRepository();
        // $schedule->command('inspire')->hourly();
        $schedule->call(function () {
           Log::info('test', ['just test']);
        })->everyMinute();
        $schedule->job(new TopSellingProductJob($topProducts))->everyTenMinutes();
        $schedule->job(new TopSellingCategoriesJob($topCategories))->everyTenMinutes();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
