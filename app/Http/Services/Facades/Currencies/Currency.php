<?php

namespace App\Http\Services\Facades\Currencies;

class Currency extends \Illuminate\Support\Facades\Facade
{
    protected static function getFacadeAccessor(): string
    {
        return "Currency";
    }
}
