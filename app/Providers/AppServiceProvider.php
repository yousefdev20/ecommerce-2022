<?php

namespace App\Providers;

use App\Repositories\Currencies\Currency;
use App\Repositories\Currencies\CurrencyInterface;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(CurrencyInterface::class, function () {
            return new Currency();
        });

        $this->app->bind('Currency', function () {
            return new \App\Http\Services\Currency(new Currency());
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
