<?php

namespace App\Providers;

use App\Repositories\Colors\Colors;
use App\Repositories\Colors\ColorsInterface;
use Illuminate\Support\ServiceProvider;
use App\Repositories\Currencies\Currency;
use App\Repositories\Currencies\CurrencyInterface;
use App\Repositories\Category\CategoriesRepository;
use App\Repositories\Category\CategoriesRepositoryInterface;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        app()->bind(CurrencyInterface::class, function () {
            return new Currency();
        });

        app()->bind(CategoriesRepositoryInterface::class, function () {
            return new CategoriesRepository();
        });

        app()->bind(ColorsInterface::class, function () {
            return new Colors();
        });

        app()->bind('Currency', function () {
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
