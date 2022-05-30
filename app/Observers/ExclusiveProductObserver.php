<?php

namespace App\Observers;

use App\Jobs\LogJob;
use Illuminate\Support\Facades\Queue;
use App\Models\Product\ExclusiveProduct;
use App\Repositories\Exclusives\ExclusivesRepositoryInterface;

class ExclusiveProductObserver
{
    /**
     * @var ExclusivesRepositoryInterface
     */
    protected $exclusivesRepository;

    public function __construct(ExclusivesRepositoryInterface $exclusivesRepository)
    {
        $this->exclusivesRepository = $exclusivesRepository;
    }

    /**
     * Handle the Currency "created" event.
     *
     * @return void
     */
    public function created(ExclusiveProduct $product): void
    {
        $this->exclusivesRepository->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'create_exclusive_product', $product));
    }

    /**
     * Handle the Currency "updated" event.
     *
     * @param ExclusiveProduct $product
     * @return void
     */
    public function updated(ExclusiveProduct $product): void
    {
        $this->exclusivesRepository->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'update_exclusive_product', $product->getDirty()));
    }

    /**
     * Handle the Currency "deleted" event.
     *
     * @param ExclusiveProduct $product
     * @return void
     */
    public function deleted(ExclusiveProduct $product): void
    {
        $this->exclusivesRepository->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_exclusive_product', $product));
    }

    /**
     * Handle the Currency "deleted" event.
     *
     * @return void
     */
    public function forceDeleted(ExclusiveProduct $product): void
    {
        $this->exclusivesRepository->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_exclusive_product', $product));
    }
}
