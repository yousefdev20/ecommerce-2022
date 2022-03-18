<?php

namespace App\Models\Product;

use App\Models\Currency\Currency;
use App\Models\Slider;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use \App\Http\Services\Facades\Currencies\Currency as FacadeCurrency;

class Product extends Model
{
    use HasFactory;

    protected $with = ['currency'];
    protected $appends = ['status'];
    protected int $originCurrencyId = 0;
    protected $fillable = [
        'name_ar', 'name_en', 'regular_price', 'sale_price',
        'quantity', 'image', 'currency_id', 'category_id',
        'product_description_id'
    ];

    /** (Start) Custom Attributes section **/

    public function getCurrencyIdAttribute($value): int
    {
        $this->originCurrencyId = $value;
        return FacadeCurrency::id() ?? $value;
    }

    public function setImageAttribute($value)
    {
        $this->attributes['image'] = str_replace('public', 'storage', $value);
    }

    public function getImageAttribute($value): string|\Illuminate\Contracts\Routing\UrlGenerator|\Illuminate\Contracts\Foundation\Application
    {
        return url($value ?? '');
    }

    public function getSalePriceAttribute($value): float
    {
        if (FacadeCurrency::id() ?? false) {
            return round(((FacadeCurrency::exchange($value, $this->originCurrencyId ?? 1) * 10) / 10), 2);
        }
        return round($value, 2);
    }

    public function getRegularPriceAttribute($value): float|int|null
    {
        if (FacadeCurrency::id() ?? false) {
            return round(((FacadeCurrency::exchange($value, $this->originCurrencyId ?? 1) * 10) / 10), 2);
        }
        return round($value, 2);
    }

    public function getStatusAttribute(): string
    {
        return $this->quantity >= 1 ? 'in-stock' : 'out-of-stock';
    }
    /** (End) Custom Attributes section **/

    /** (Start) Relationships section **/

    public function order()
    {
        return $this->belongsToMany(Product::class, 'order_product');
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
        return $this->belongsToMany(Color::class, 'product_color', 'product_id', 'color_id');
    }

    public function images()
    {
        return $this->hasMany(ProductImages::class);
    }

    public function sizes()
    {
        return $this->hasMany(ProductSize::class);
    }

    public function favorite()
    {
        return $this->hasMany(ProductFavorite::class);
    }

    public function slider()
    {
        return $this->hasOne(Slider::class);
    }

    /** (End) Relationships section **/

    /** (Start) [global, local]Condition section **/

    public function scopeInStock($query)
    {
        $query->where('quantity', '>=', 1);
    }
    /** (End) [global, local]Condition section **/

}
