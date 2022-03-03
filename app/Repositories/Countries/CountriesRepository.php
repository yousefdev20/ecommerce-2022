<?php

namespace App\Repositories\Countries;

use App\Models\Country;
use Illuminate\Support\Facades\Cache;

class CountriesRepository implements CountriesRepositoryInterface
{
    public function get()
    {
        return Cache::rememberForever('countries', function () {
            return Country::query()->get();
        });
    }

    public function store()
    {
        Cache::rememberForever('countries',  function () {
            return Country::query()->get();
        });
    }

    public function delete(): bool
    {
        return Cache::forget('countries');
    }

    public function refresh()
    {
        $this->delete();
        $this->store();
    }
}
