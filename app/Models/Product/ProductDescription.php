<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductDescription extends Model
{
    use HasFactory;

    protected $fillable = ['description_en', 'description_ar', 'depth', 'height', 'width'];

    public function product() {

        return $this->hasOne(Product::class);
    }
}
