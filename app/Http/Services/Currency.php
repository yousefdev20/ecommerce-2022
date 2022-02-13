<?php

namespace App\Http\Services;

use App\Repositories\Currencies\CurrencyInterface;

class Currency
{
    protected  CurrencyInterface $currency;
    protected \App\Models\Currency\Currency $currentCurrency;
    protected string $currentCurrencyCode = 'USD';

    public function __construct(CurrencyInterface $currency)
    {
        $this->currency = $currency;
        $this->currentCurrencyCode = request()->header('currency_code') ?? 'USD';
        $this->currentCurrency = $currency->find($this->currentCurrencyCode);
    }

    public function find(string $code = 'USD')
    {
        return $this->currentCurrency = $this->currency->find($code);
    }

    public function get()
    {
        return $this->currentCurrency;
    }

    public function exchange(int $value = 0)
    {
        return $value * $this->currentCurrency->exchange ?? 0;
    }

    public function id(): int
    {
        return $this->currentCurrency->id ?? 0;
    }
}
