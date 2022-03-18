<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductImages extends Model
{
    use HasFactory;

    protected $fillable = ['product_id', 'path'];

    public function setPathAttribute($value) {
        $this->attributes['path'] = str_replace('public', 'storage', $value);
    }

    public function getPathAttribute($value): string|\Illuminate\Contracts\Routing\UrlGenerator|\Illuminate\Contracts\Foundation\Application
    {
        return url($value ?? '');
    }
}
