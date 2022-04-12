<?php

namespace App\Observers;

use App\Repositories\Countries\CountriesRepositoryInterface;

class CountryObserver
{
    protected CountriesRepositoryInterface $countries;

    public function __construct(CountriesRepositoryInterface $countries)
    {
        $this->countries = $countries;
    }

    /**
     * Handle the Country "created" event.
     *
     * @return void
     */
    public function created()
    {
        $this->countries->refresh();
    }

    /**
     * Handle the Country "updated" event.
     *
     * @return void
     */
    public function updated()
    {
        $this->countries->refresh();
    }

    /**
     * Handle the Country "deleted" event.
     *
     * @return void
     */
    public function deleted()
    {
        $this->countries->refresh();
    }
}
