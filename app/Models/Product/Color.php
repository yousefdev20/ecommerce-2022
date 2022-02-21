<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
    use HasFactory;

    protected $fillable = ['name_ar', 'name_en', 'code'];

    public function products() {

        return $this->belongsToMany(Product::class, 'product_color');
    }
}
