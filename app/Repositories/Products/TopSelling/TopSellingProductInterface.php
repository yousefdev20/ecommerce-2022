<?php

namespace App\Repositories\Products\TopSelling;

use App\Repositories\IStorable;

interface TopSellingProductInterface extends IStorable
{
    public function ids();
}
