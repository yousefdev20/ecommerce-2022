<?php

namespace App\Scopes;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class ProductInStock
{
    public function apply(Builder $builder, Model $model)
    {
        $builder->where('quantity', '>=', 1);
    }
}
