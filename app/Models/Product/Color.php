<?php

namespace App\Models\Product;

use Illuminate\Database\Eloquent\Model;
use App\Http\Services\Facades\Language\Language;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Color extends Model
{
    use HasFactory;

    protected $fillable = ['name_ar', 'name_en', 'code'];

    /**
     * Start relationship section.
     */

    /**
     * @return BelongsToMany
     */
    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'product_color');
    }

    /**
     * End RelationShip section.
     */

    /**
     * Start custom attributes
     *
     * @param $value
     * @return mixed|string
     */
    public function getNameEnAttribute($value): mixed
    {
        if (Language::code() === 'en') {
            return $value;
        }
        return $this->name_ar ?? '';
    }
}
