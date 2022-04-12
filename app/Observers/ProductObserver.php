<?php

namespace App\Observers;

use App\Jobs\Categories\TopSellingCategoriesJob;
use App\Jobs\DangerQuantityProductJob;
use App\Jobs\Products\TopSellingProductJob;
use App\Models\Product\Product;
use App\Repositories\Category\CategoriesRepository;
use App\Repositories\Exclusives\ExclusivesRepositoryInterface;
use App\Repositories\Products\TopSelling\TopSellingProductInterface;
use App\Repositories\Products\TopSelling\TopSellingProductRepositories;
use Illuminate\Support\Facades\Queue;

class ProductObserver
{
    protected ExclusivesRepositoryInterface $exclusivesRepository;
    protected TopSellingProductInterface $topSellingProduct;

    public function __construct(ExclusivesRepositoryInterface $exclusivesRepository, TopSellingProductInterface $topSellingProduct)
    {
        $this->exclusivesRepository = $exclusivesRepository;
        $this->topSellingProduct = $topSellingProduct;
    }

    public function created(Product $product)
    {
        $topSelling = new TopSellingProductRepositories();
        Queue::push(new TopSellingProductJob($topSelling));
        $this->exclusivesRepository->refresh();
    }

    public function updated(Product $product)
    {
        $topSelling = new TopSellingProductRepositories();
        Queue::push(new TopSellingProductJob($topSelling));
        Queue::push(new DangerQuantityProductJob());
        $this->exclusivesRepository->refresh();
    }
}
