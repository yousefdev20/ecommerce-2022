<?php

namespace App\Providers;

use App\Http\Services\Cart;
use App\Repositories\Colors\Colors;
use App\Repositories\Products\TopSelling\TopSellingProductInterface;
use App\Repositories\Products\TopSelling\TopSellingProductRepositories;
use Illuminate\Support\ServiceProvider;
use App\Repositories\Currencies\Currency;
use App\Repositories\Colors\ColorsInterface;
use App\Repositories\Currencies\CurrencyInterface;
use App\Repositories\Countries\CountriesRepository;
use App\Repositories\Category\CategoriesRepository;
use App\Repositories\Exclusives\ExclusiveRepository;
use App\Repositories\Countries\CountriesRepositoryInterface;
use App\Repositories\Exclusives\ExclusivesRepositoryInterface;
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

        app()->bind(ExclusivesRepositoryInterface::class, function () {
            return new ExclusiveRepository();
        });

        app()->bind(TopSellingProductInterface::class, function () {
            return new TopSellingProductRepositories();
        });

        app()->bind(ColorsInterface::class, function () {
            return new Colors();
        });

        app()->bind(CountriesRepositoryInterface::class, function () {
            return new CountriesRepository();
        });

        app()->bind('Currency', function () {
            return new \App\Http\Services\Currency(new Currency());
        });

        app()->bind('Cart', function () {
            return new Cart();
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
