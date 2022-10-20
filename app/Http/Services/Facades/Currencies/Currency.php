<?php

namespace App\Http\Services\Facades\Currencies;

/**
 * @method static id()
 * @method static defaultCurrency()
 * @method static setCurrency(int $id)
 * @method static exchange(int|null $value, int $currency)
 * @method static get()
 * @method static find(string|null $code)
 **/
class Currency extends \Illuminate\Support\Facades\Facade
{
    protected static function getFacadeAccessor(): string
    {
        return "Currency";
    }
}
