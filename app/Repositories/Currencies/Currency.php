<?php

namespace App\Repositories\Currencies;

use Illuminate\Support\Facades\Cache;
use App\Http\Services\Facades\Language\Language;

class Currency implements CurrencyInterface
{

    public function get()
    {
        /**
         * handel IMultiLingual
         */
        return $this->handel();
    }

    public function store()
    {
        Cache::rememberForever('currencies', function (){
            return \App\Models\Currency\Currency::query()->get();
        });
    }

    public function find(string|null $name)
    {
        return collect($this->get())->where('code_en', '=', $name)->first() ?? null;
    }

    public function where(string $column, $value)
    {
        return collect($this->get())->where($column, '=', $value)->first() ??
            collect($this->get())->where($column, '=', 'USD')->first();
    }

    public function delete(): bool
    {
        return Cache::forget('currencies');
    }

    public function refresh()
    {
        $this->delete();
        $this->store();
    }

    public function handel()
    {
        $currency = Cache::rememberForever('currencies', function (){
            return \App\Models\Currency\Currency::query()->get();
        });
        if (Language::code() !== 'en') {
            $_clone = [];
            foreach ($currency as $key => $item) {
                $_clone[$key] = $item;
                $_clone[$key]['name_en'] = $item->name_ar;
                $_clone[$key]['code_en'] = $item->code_ar;
            }
            return $_clone;
        }
        return $currency;
    }
}
