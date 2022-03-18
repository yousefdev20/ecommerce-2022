<?php

namespace App\Observers;

use App\Models\Currency\Currency;
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
    public function created()
    {
        $this->exclusivesRepository->refresh();
    }

    /**
     * Handle the Currency "updated" event.
     *
     * @return void
     */
    public function updated()
    {
        $this->exclusivesRepository->refresh();
    }

    /**
     * Handle the Currency "deleted" event.
     *
     * @return void
     */
    public function deleted()
    {
        $this->exclusivesRepository->refresh();
    }

    /**
     * Handle the Currency "deleted" event.
     *
     * @return void
     */
    public function forceDeleted()
    {
        $this->exclusivesRepository->refresh();
    }
}
