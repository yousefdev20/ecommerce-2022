<?php

namespace App\Repositories\Category;

use App\Repositories\IStorable;

interface CategoriesRepositoryInterface extends IStorable
{
    public function topSelling();
    public function refreshTopSelling();
    public function ids();

}
