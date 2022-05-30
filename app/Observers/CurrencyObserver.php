<?php

namespace App\Observers;

use App\Jobs\LogJob;
use App\Models\Currency\Currency;
use Illuminate\Support\Facades\Queue;
use App\Repositories\Currencies\CurrencyInterface;

class CurrencyObserver
{
    /**
     * @var CurrencyInterface
     */
    protected CurrencyInterface $currencies;

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
    public function created(Currency $currency): void
    {
        $this->currencies->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'create_currency', $currency));
    }

    /**
     * Handle the Currency "updated" event.
     *
     * @param Currency $currency
     * @return void
     */
    public function updated(Currency $currency): void
    {
        $this->currencies->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'update_currency', $currency->getDirty()));
    }

    /**
     * Handle the Currency "deleted" event.
     *
     * @param Currency $currency
     * @return void
     */
    public function deleted(Currency $currency): void
    {
        $this->currencies->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_currency', $currency->id));
    }

    /**
     * Handle the Currency "restored" event.
     *
     * @param Currency $currency
     * @return void
     */
    public function restored(Currency $currency): void
    {
        //
    }

    /**
     * Handle the Currency "force deleted" event.
     *
     * @param Currency $currency
     * @return void
     */
    public function forceDeleted(Currency $currency): void
    {
        $this->currencies->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_currency', $currency));
    }
}
