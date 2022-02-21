<?php

namespace App\Rules;

use Illuminate\Support\Facades\DB;
use App\Http\Requests\StoreOrderRequest;
use Illuminate\Contracts\Validation\Rule;

class QuantityIsEnough implements Rule
{
    protected int $value;
    protected int $requestProductCount;

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $this->value = $value;
        $this->requestProductCount = StoreOrderRequest::countOfProducts($this->value);
        return DB::table('products')
            ->where([['id', '=', $value], ['quantity', '!=', null], ['quantity', '>=', $this->requestProductCount]])
            ->exists();
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message(): string
    {
        return 'The status of this item is Out of stock, ' . $this->value;
    }
}
