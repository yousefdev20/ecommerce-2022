<?php

namespace App\Repositories\Category;

use App\Repositories\IMultiLingual;
use App\Repositories\ISearchable;
use App\Repositories\IStorable;

interface CategoriesRepositoryInterface extends IStorable, ISearchable, IMultiLingual
{
    public function topSelling();
    public function refreshTopSelling();
    public function ids();

}
