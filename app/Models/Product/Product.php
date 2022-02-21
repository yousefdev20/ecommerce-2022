<?php

namespace App\Models\Product;

use App\Models\Currency\Currency;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use \App\Http\Services\Facades\Currencies\Currency as FacadeCurrency;

class Product extends Model
{
    use HasFactory;

    protected $with = ['currency'];
    protected $fillable = [
        'name_ar', 'name_en', 'regular_price', 'sale_price',
        'quantity', 'image', 'currency_id', 'category_id',
        'description_id'
    ];

    public function getImageAttribute($value): string|\Illuminate\Contracts\Routing\UrlGenerator|\Illuminate\Contracts\Foundation\Application
    {
        return url($value ?? '');
    }

    public function getCurrencyIdAttribute($value): int
    {
        return FacadeCurrency::id();
    }

    public function getSalePriceAttribute($value): float
    {
        return ((FacadeCurrency::exchange($value) * 10) / 10);
    }

    public function getRegularPriceAttribute($value)
    {
        return ((FacadeCurrency::exchange($value) * 100) / 100);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class);
    }

    public function description()
    {
        return $this->belongsTo(ProductDescription::class, 'product_description_id', 'id');
    }

    public function colors()
    {
        return $this->belongsToMany(Product::class, 'product_color');
    }

    public function images()
    {
        return $this->hasMany(ProductImages::class);
    }

    public function sizes()
    {
        return $this->hasMany(ProductSize::class);
    }
}
