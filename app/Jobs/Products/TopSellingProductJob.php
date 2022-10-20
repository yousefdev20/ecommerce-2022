<?php

namespace App\Jobs\Products;

use App\Repositories\Products\TopSelling\TopSellingProductRepositories;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class TopSellingProductJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public TopSellingProductRepositories $products;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($products)
    {
        $this->products = $products;
        $this->products->refresh();
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
//        $this->products->refresh();
    }
}
