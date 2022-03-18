<?php

namespace App\Models\Deal;

use App\Models\Product\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Carbon;

class Deal extends Model
{
    use HasFactory;

    protected $appends = ['status'];
    protected $fillable = ['expiration_date'];

    public function getStatusAttribute(): bool
    {
        return $this->expiration_date > Carbon::now()->endOfWeek()->format('Y-m-d H:i:s');
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'deal_product');
    }

    public function latestDealProduct()
    {
        return $this->belongsToMany(Product::class, 'deal_product')->with(['currency'])->latest()->limit(9);
    }

    public function scopeThisWeek($query)
    {
        $query->where('expiration_date', '>', now());
    }

    protected static function booted()
    {
//        static::addGlobalScope(new ActiveDealScope());
    }
}
