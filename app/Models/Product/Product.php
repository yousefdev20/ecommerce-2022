<?php

namespace App\Models\Product;

use App\Jobs\Products\ProductRateJob;
use App\Models\Slider;
use App\Models\ProductReview;
use App\Models\Currency\Currency;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use \App\Http\Services\Facades\Currencies\Currency as FacadeCurrency;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Queue;

class Product extends Model
{
    use HasFactory;

    protected $with = ['currency'];
    protected $withCount = ['reviews'];
    protected int $originCurrencyId = 0;
    protected $appends = ['status', 'rate', 'unit_id', 'clone_price'];
    protected $fillable = [
        'name_ar', 'name_en', 'regular_price', 'sale_price',
        'quantity', 'image', 'currency_id', 'category_id',
        'product_description_id', 'kg', 'pieces' , 'sale_unit'
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

    public function getRateAttribute(): int
    {
        if (Cache::has('rate:' . $this->id ?? 0)) {
            return Cache::get('rate:' . $this->id ?? 0) ?? 0;
        }
        Queue::push(new ProductRateJob($this->id));
        return 0;
    }

    public function getSaleUnitAttribute($value): \Illuminate\Support\Collection|null|array
    {
        $unit = collect(config('product.units'))->where('id', $value)->first();
        if ($value == 1) {
            $unit = collect($unit)->put('kg', $this->kg ?? 0);
        }
        if ($value == 2) {
            $unit = collect($unit)->put('pieces', $this->pieces ?? 0);
        }
        return $unit;
    }

    public function getUnitIdAttribute(): int
    {
        return $this?->sale_unit['id'] ?? 1;
    }

    public function getClonePriceAttribute(): int
    {
        return $this?->sale_price;
    }

    /** (End) Custom Attributes section **/

    /** (Start) Relationships section **/

    public function order(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'order_product');
    }

    public function category(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function currency(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Currency::class);
    }

    public function description(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(ProductDescription::class, 'product_description_id', 'id');
    }

    public function package(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(Package::class);
    }

    public function package_items(): \Illuminate\Database\Eloquent\Relations\HasManyThrough
    {
        return $this->hasManyThrough(PackageItem::class, Package::class);
    }

    public function reviews(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ProductReview::class);
    }

    public function colors(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(Color::class, 'product_color', 'product_id', 'color_id');
    }

    public function images(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ProductImages::class);
    }

    public function sizes(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ProductSize::class);
    }

    public function favorite(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ProductFavorite::class);
    }

    public function slider(): \Illuminate\Database\Eloquent\Relations\HasOne
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

    protected static function booted()
    {
//        static::addGlobalScope('inScope', function (Builder $builder) {
//            $builder->where('quantity', '>=', 1);
//        });
//        static::addGlobalScope(new ProductInStock());
    }
}
