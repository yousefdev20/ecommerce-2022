<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductFavorite extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'product_id'];

    public function product()
    {
        $this->belongsTo(Product::class);
    }
}
