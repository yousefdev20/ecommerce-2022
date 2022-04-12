<?php

namespace App\Jobs;

use App\Models\Report;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class DailyReportJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {
        $orders = DB::table('orders')->count();
        $delivered_orders = DB::table('orders')->where('status', 4)->count();
        $products = DB::table('products')->count();
        $customers = DB::table('users')->count();
        Report::query()->create([
            'orders' => $orders, 'delivered_order' => $delivered_orders,
            'customers' => $customers, 'products'  => $products
        ]);
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $orders = DB::table('orders')->count();
        $delivered_orders = DB::table('orders')->where('status', 4)->count();
        $products = DB::table('products')->count();
        $customers = DB::table('users')->count();
        Report::query()->create([
            'orders' => $orders, 'delivered_order' => $delivered_orders,
            'customers' => $customers, 'products'  => $products
        ]);
    }
}
