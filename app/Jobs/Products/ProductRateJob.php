<?php

namespace App\Jobs\Products;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ProductRateJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected int $id;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(int $id)
    {
        $this->id = $id;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $rate = DB::table('product_reviews')
            ->where('product_id', $this->id)
            ->selectRaw('count(rate) as count_product,
             sum(rate) product_rate, product_id')
            ->groupBy(['product_id'])->first();
        Cache::put('rate:' . $this->id, ceil(($rate?->product_rate ?? 0) / ($rate?->count_product ?? 1)));
    }
}
