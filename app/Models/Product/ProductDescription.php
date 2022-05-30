<?php

namespace App\Models\Product;

use App\Http\Services\Facades\Language\Language;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductDescription extends Model
{
    use HasFactory;

    protected $fillable = ['description_en', 'description_ar', 'depth', 'height', 'width'];

    public function product() {

        return $this->hasOne(Product::class);
    }

    public function getDescriptionEnAttribute($value)
    {
        if (Language::code() === 'en') {
            return $value;
        }
        return $this->description_ar ?? '';
    }
}
