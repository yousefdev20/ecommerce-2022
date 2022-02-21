<?php

namespace App\Http\Requests;

use App\Rules\QuantityIsEnough;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreOrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'order.products.*.product_id' => [
                'required', 'exists:products,id', new QuantityIsEnough()
            ],
            'user_id' => 'nullable|exists:users,id',
            'coupon_id' => 'nullable|exists:coupon_codes,id',
            'currency_id' => 'required|exists:currencies,id'
        ];
    }

    public static function countOfProducts(int $index): int
    {
        $products = request('order.products');
        $arr = [];
        foreach ($products ?? [] as $product) {
            $arr[$product['product_id']] = 0;
            foreach ($products ?? [] as $value) {
                if ($product['product_id'] == $value['product_id']) {
                    $arr[$product['product_id']] += 1;
                }
            }
        }
        return $arr[$index] ?? 0;
    }
}
