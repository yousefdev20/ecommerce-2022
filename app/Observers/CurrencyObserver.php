<?php

namespace App\Observers;

use App\Models\Currency\Currency;
use App\Repositories\Currencies\CurrencyInterface;

class CurrencyObserver
{
    /**
     * @var CurrencyInterface
     */
    protected $currencies;

    public function __construct(CurrencyInterface $currency)
    {
        $this->currencies = $currency;
    }

    /**
     * Handle the Currency "created" event.
     *
       * @param Currency $currency
     * @return void
     */
    public function created(Currency $currency)
    {
//        $this->currencies->
    }

    /**
     * Handle the Currency "updated" event.
     *
       * @param Currency $currency
     * @return void
     */
    public function updated(Currency $currency)
    {
        //
    }

    /**
     * Handle the Currency "deleted" event.
     *
       * @param Currency $currency
     * @return void
     */
    public function deleted(Currency $currency)
    {
        //
    }

    /**
     * Handle the Currency "restored" event.
     *
       * @param Currency $currency
     * @return void
     */
    public function restored(Currency $currency)
    {
        //
    }

    /**
     * Handle the Currency "force deleted" event.
     *
       * @param Currency $currency
     * @return void
     */
    public function forceDeleted(Currency $currency)
    {
        //
    }
}
