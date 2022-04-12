<?php

namespace App\Models\Order;

use App\Models\Currency\Currency;
use App\Models\Product\Color;
use App\Models\Product\Product;
use App\Models\User;
use App\Repositories\Sizes\Sizes;
use App\Repositories\Sizes\SizesInterface;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Order extends Model
{
    use HasFactory;

    protected $with = ['currency'];
    protected $appends = ['status_string'];
    protected $fillable = [
        'user_id', 'workflow_id', 'coupon_id', 'currency_id',
        'shipping_address_id', 'billing_address_id',
        'amount', 'paid_status', 'note', 'admin_note', 'status'
    ];

    /**
     * Attributes
     */

    public function getStatusStringAttribute(): string
    {
        return collect(config('order.status'))
                ->where('id', $this?->status ?? 1)->first()['name_en'] ?? 'pending';
    }

    /**
     * relationShips section.
     *
     */
    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'order_product')->select(['*'])
            ->groupBy(['products.id', 'order_product.size_id', 'order_product.color_id'])
            ->selectRaw('products.*, count(products.id) as count,
             (products.sale_price * count(products.id)) as sum_sale_price,
                     colors.id as color_relation_id, colors.name_en as color_name_en,
                     colors.name_ar as color_name_ar, sizes.id as size_relation_id, sizes.name_en as size_name_en,
                     sizes.name_ar as size_name_ar')
            ->leftJoin('colors', 'order_product.color_id', '=', 'colors.id')
            ->leftJoin('sizes', 'order_product.size_id', '=', 'sizes.id');
    }

    public function user(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function currency(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Currency::class);
    }

    public function workflow(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Workflow::class);
    }

    public function coupon(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Coupon::class);
    }

    public function shippingAddress(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(ShippingAddress::class);
    }

    public function billingAddress(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(BillingAddress::class);
    }

    public function invoice(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(Invoice::class);
    }

    /**
     * End RelationShips section.
     */
}
