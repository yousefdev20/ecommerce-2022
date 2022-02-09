<?php

namespace App\Models\Deal;

use App\Models\Product\Product;
use App\Scopes\ActiveDealScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Deal extends Model
{
    use HasFactory;

    protected $fillable = ['expiration_date'];

    protected static function booted()
    {
        static::addGlobalScope(new ActiveDealScope());
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'deal_product');
    }

    public function latestDealProduct()
    {
        return $this->belongsToMany(Product::class, 'deal_product')->with(['currency'])->latest()->limit(9);
    }
}
