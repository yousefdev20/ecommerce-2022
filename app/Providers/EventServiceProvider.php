<?php

namespace App\Providers;

use App\Models\Country;
use App\Models\Product\Category;
use App\Models\Product\Color;
use App\Observers\CategoryObserver;
use App\Observers\ColorsObserver;
use App\Observers\CountryObserver;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array<class-string, array<int, class-string>>
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        Category::observe(CategoryObserver::class);
        Color::observe(ColorsObserver::class);
        Country::observe(CountryObserver::class);
    }
}
