<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ExclusiveProduct extends Model
{
    use HasFactory;

    protected $with = ['product'];
    protected $appends = ['status'];
    protected $fillable = ['product_id', 'expiration_date'];

    public function product(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Product::class);
    }

    public function getStatusAttribute(): bool
    {
        return $this->expiration_date > now();
    }

    public function scopeActive($query)
    {
        $query->where('expiration_date', '>', now());
    }
}
