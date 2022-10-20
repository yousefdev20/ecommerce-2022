<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductSize extends Model
{
    use HasFactory;
    protected $appends = ['size_id'];

    protected $fillable = ['size', 'product_id'];

    public function getSizeAttribute($value): string
    {
        foreach (config('product.sizes') as $item) {
            if ($item['id'] == $value) {
                return $item['name_en'];
            }
        }
        return '';
    }

    public function getSizeIdAttribute(): int
    {
        foreach (config('product.sizes') as $item) {
            if ($item['name_en'] == $this->size) {
                return $item['id'];
            }
        }
        return 0;
    }
}
