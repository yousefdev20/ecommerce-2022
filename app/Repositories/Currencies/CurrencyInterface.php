<?php

namespace App\Repositories\Currencies;

interface CurrencyInterface
{
    public function get();
    public function find(string $code = 'USD');
    public function store();
}
