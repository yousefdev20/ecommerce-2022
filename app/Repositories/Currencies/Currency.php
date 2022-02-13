<?php

namespace App\Repositories\Currencies;

use Illuminate\Support\Facades\Cache;

class Currency implements CurrencyInterface
{

    public function get()
    {
        return Cache::rememberForever('currencies', function (){
            return \App\Models\Currency\Currency::query()->get();
        });
    }

    public function store()
    {
        Cache::rememberForever('currencies', function (){
            return \App\Models\Currency\Currency::query()->get();
        });
    }

    public function find(string $code = 'USD')
    {
        return collect($this->get())->where('code_en', '=', $code)->first() ??
            collect($this->get())->where('code_en', '=', 'USD')->first();
    }
}
