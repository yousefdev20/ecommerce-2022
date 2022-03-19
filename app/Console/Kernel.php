<?php

namespace App\Console;

use App\Jobs\Products\TopSellingProductJob;
use App\Repositories\Products\TopSelling\TopSellingProductRepositories;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

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
        // $schedule->command('inspire')->hourly();
        $schedule->job(new TopSellingProductJob($topProducts))->everyMinute();
        $schedule->job(new TopSellingProductJob($topProducts))->everyTenMinutes();
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
