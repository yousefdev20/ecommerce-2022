<?php

namespace App\Jobs\Categories;

use App\Repositories\Category\CategoriesRepositoryInterface;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class TopSellingCategoriesJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public CategoriesRepositoryInterface $categories;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($categories)
    {
        $this->categories = $categories;
        $this->categories->refreshTopSelling();
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $this->categories->refreshTopSelling();
    }
}
