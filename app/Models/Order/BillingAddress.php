<?php

namespace App\Models\Order;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BillingAddress extends Model
{
    use HasFactory;

    protected $fillable = [
        'first_name', 'last_name', 'phone', 'email', 'latitude', 'longitude',
        'state', 'zip', 'country_id', 'town', 'note',
        'user_id', 'company_name', 'street_address'
    ];
    public function order()
    {
        return $this->hasOne(Order::class);
    }
}
