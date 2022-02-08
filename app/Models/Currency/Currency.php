<?php

namespace App\Models\Currency;

use App\Models\Product\Product;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'code', 'exchange'];

    public function products() {

        return $this->hasMany(Product::class);
    }
}
