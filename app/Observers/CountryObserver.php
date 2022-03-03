<?php

namespace App\Observers;

use App\Repositories\IStorable;

class CountryObserver
{
    protected IStorable $countries;

    public function __construct(IStorable $countries)
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
