<?php

namespace App\Repositories\Currencies;

use App\Repositories\IMultiLingual;
use App\Repositories\ISearchable;
use App\Repositories\IStorable;

interface CurrencyInterface extends IStorable, ISearchable, IMultiLingual
{
}

