<?php

namespace App\Models\Product;

use App\Models\Currency\Currency;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name_ar', 'name_en', 'regular_price', 'sale_price',
        'quantity', 'image', 'currency_id', 'category_id',
        'description_id'
    ];

    public function category() {

        return $this->belongsTo(Category::class);
    }

    public function currency() {

        return $this->belongsTo(Currency::class);
    }

    public function description() {

        return $this->belongsTo(ProductDescription::class, 'product_description_id', 'id');
    }

    public function colors() {

        return $this->belongsToMany(Product::class, 'product_color');
    }

    public function images() {

        return $this->hasMany(ProductImages::class);
    }

    public function sizes() {

        return $this->hasMany(ProductSize::class);
    }
}
