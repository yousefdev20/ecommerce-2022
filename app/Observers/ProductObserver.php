<?php

namespace App\Observers;

use App\Jobs\LogJob;
use App\Models\Product\Product;
use Illuminate\Support\Facades\Queue;
use App\Jobs\DangerQuantityProductJob;
use App\Jobs\Products\TopSellingProductJob;
use App\Repositories\Exclusives\ExclusivesRepositoryInterface;
use App\Repositories\Products\TopSelling\TopSellingProductInterface;
use App\Repositories\Products\TopSelling\TopSellingProductRepositories;

class ProductObserver
{
    protected ExclusivesRepositoryInterface $exclusivesRepository;
    protected TopSellingProductInterface $topSellingProduct;

    public function __construct(ExclusivesRepositoryInterface $exclusivesRepository, TopSellingProductInterface $topSellingProduct)
    {
        $this->exclusivesRepository = $exclusivesRepository;
        $this->topSellingProduct = $topSellingProduct;
    }

    public function created(Product $product): void
    {
        $topSelling = new TopSellingProductRepositories();
        Queue::push(new TopSellingProductJob($topSelling));
        $this->exclusivesRepository->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'create_product', $product));
    }

    public function updated(Product $product): void
    {
        $topSelling = new TopSellingProductRepositories();
        Queue::push(new TopSellingProductJob($topSelling));
        Queue::push(new DangerQuantityProductJob());
        $this->exclusivesRepository->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'update_product', $product->getDirty()));
    }

    public function deleted(Product $product): void
    {
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_product', $product->id));
    }
}
