<?php

namespace App\Http\Services\Facades\Cart;

use Illuminate\Support\Facades\Facade;

/**
 * @method static get(array $cart)
 * @method static totalPrice(array $cart)
 * @method static itemQuantity(array $cart, int $id)
 **/

class Cart extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return 'Cart';
    }
}
