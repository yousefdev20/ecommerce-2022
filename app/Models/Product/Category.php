<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = ['name_ar', 'name_en', 'image', 'parent_id', 'level'];

    protected $with = ['children'];

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public function parent()
    {
        return $this->belongsTo(Category::class,'parent_id');
    }

    public function children()
    {
        return $this->hasMany(Category::class,'parent_id')
            ->where([['parent_id', '<>', null], ['level', '>', 1]]);
    }

    public function scopeDoseNotHaveParent($query)
    {
        $query->where([['parent_id', '=', null], ['level', '=', 1]]);
    }

}
