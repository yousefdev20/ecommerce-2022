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

    public function find(string|null $code)
    {
        return collect($this->get())->where('code_en', '=', $code)->first() ?? null;
    }

    public function where(string $column = 'id', $value)
    {
        return collect($this->get())->where($column, '=', $value)->first() ??
            collect($this->get())->where($column, '=', 'USD')->first();
    }

    public function delete()
    {
        return Cache::forget('currencies');
    }

    public function refresh()
    {
        $this->delete();
        $this->store();
    }
}
