<?php

namespace App\Observers;

use App\Jobs\LogJob;
use App\Models\Country;
use Illuminate\Support\Facades\Queue;
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
     * @param Country $country
     * @return void
     */
    public function created(Country $country): void
    {
        $this->countries->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'create_country', $country));
    }

    /**
     * Handle the Country "updated" event.
     *
     * @param Country $country
     * @return void
     */
    public function updated(Country $country): void
    {
        $this->countries->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'update_country', $country->getDirty()));
    }

    /**
     * Handle the Country "deleted" event.
     *
     * @param Country|null $country
     * @return void
     */
    public function deleted(?Country $country): void
    {
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_country', $country->id));
        $this->countries->refresh();
    }
}
