<?php

namespace App\Models\Order;

use App\Models\Product\Product;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'workflow_id', 'coupon_id', 'currency_id',
        'shipping_address_id', 'billing_address_id',
        'amount', 'paid_status'
    ];

    public function products() {

        return $this->belongsToMany(Product::class, 'order_product');
    }

    public function user() {

        return $this->belongsTo(User::class);
    }

    public function workflow() {

        return $this->belongsTo(Workflow::class);
    }

    public function coupon() {

        return $this->belongsTo(Coupon::class);
    }

    public function shippingAddress() {

        return $this->belongsTo(ShippingAddress::class);
    }

    public function billingAddress() {

        return $this->belongsTo(BillingAddress::class);
    }
}
