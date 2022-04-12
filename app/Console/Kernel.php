<?php

namespace App\Console;

use App\Jobs\Categories\TopSellingCategoriesJob;
use App\Jobs\DailyReportJob;
use App\Jobs\DangerQuantityProductJob;
use App\Jobs\DeleteInactiveDealJob;
use App\Jobs\DeleteInactiveExclusiveJob;
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
        /**
         * start composition section.
         */
        $topCategories = new CategoriesRepository();
        $topProducts = new TopSellingProductRepositories();

        /**
         * start schedule section.
         */
        $schedule->job(new TopSellingCategoriesJob($topCategories))->everyTenMinutes();
        $schedule->job(new TopSellingProductJob($topProducts))->everyTenMinutes();
        $schedule->job(new DeleteInactiveExclusiveJob())->dailyAt('23:59');
        $schedule->job(new DeleteInactiveDealJob())->dailyAt('23:59');
        $schedule->job(new DangerQuantityProductJob())->everyTenMinutes();
        $schedule->job(new DailyReportJob())->everyMinute();
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
