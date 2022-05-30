<?php

namespace App\Http\Services;

use App\Repositories\Currencies\CurrencyInterface;

class Currency
{
    protected CurrencyInterface $currency;
    protected string|null $currentCurrencyCode;
    protected string|null|int $currentCurrencyId;
    protected \App\Models\Currency\Currency|null $currentCurrency;

    public function __construct(CurrencyInterface $currency)
    {
        $this->currency = $currency;
        $this->currentCurrencyCode = request()->header('currency_code') ?? null;
        $this->currentCurrencyId = request()->header('currency_id') ?? null;
        $this->currentCurrency = $currency->where('id', $this->currentCurrencyId);
    }

    public function find(string|null $code): ?\App\Models\Currency\Currency
    {
        $this->currentCurrency = $this->currency->find($code);
        return $this->currentCurrency;
    }

    public function get(): ?\App\Models\Currency\Currency
    {
        return $this->currentCurrency;
    }

    public function exchange(int|null $value, int $currency): float|int|null
    {
        /**
         * process:
         * (value * (exchange base on exchange value for this item)) = dollar value
         * to calculate value base on user request
         * (dollar / default currency of exchange value)
         */

        /**
         * ! the regular price nullable not mandatory field
         * so if the value is null this method will return null value
         */
        if ($value === null) {
            return null;
        }

        $currency = $this->currency->where('id', $currency);
        return (($value / $currency?->exchange) * $this->currentCurrency?->exchange ?? 0);
    }

    public function id(): int|null
    {
        return $this->currentCurrency?->id ?? null;
    }

    public function defaultCurrency()
    {
        return $this->currency->find(config('currency.default'));
    }

    public function setCurrency(null|int $id): void
    {
        $this->currentCurrency = $this->currency->where('id', $id ?? $this->defaultCurrency());
    }
}
