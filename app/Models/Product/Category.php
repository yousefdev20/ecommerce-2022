<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Model;
use App\Http\Services\Facades\Language\Language;

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
//        $query->where([['parent_id', '=', null], ['level', '=', 1]]);
    }

    public function scopeHasProducts($query)
    {
        $query->has('products');
    }

    public function setImageAttribute($value)
    {
        $this->attributes['image'] = str_replace('public', 'storage', $value);
    }

    public function getImageAttribute($value): null|string|\Illuminate\Contracts\Routing\UrlGenerator|\Illuminate\Contracts\Foundation\Application
    {
        return $value ? url($value ?? '') : null;
    }

    public function getNameEnAttribute($value)
    {
        if (Language::code() !== 'en'){
            return $this->name_ar ?? '';
        }
        return $value;
    }

}
