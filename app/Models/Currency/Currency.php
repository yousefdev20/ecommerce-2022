<?php

namespace App\Models\Currency;

use App\Http\Services\Facades\Language\Language;
use App\Models\Product\Product;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    use HasFactory;

    protected $fillable = ['name_ar', 'name_en', 'code_ar', 'code_en', 'exchange'];

    public function getNameEnAttribute($value)
    {
        if (Language::code() === 'en') {
            return $value;
        }
        return $this->name_ar ?? '';
    }

    public function getCodeEnAttribute($value)
    {
        if (Language::code() === 'en') {
            return $value;
        }
        return $this->code_ar ?? '';
    }

    public function products(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Product::class);
    }

    public function scopeHasProducts($query)
    {
        $query->has('products');
    }
}
