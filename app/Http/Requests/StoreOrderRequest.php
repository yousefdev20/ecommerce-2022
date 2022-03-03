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
            'billing.first_name' => 'required',
            'billing.last_name' => 'required',
            'billing.phone' => 'required',
            'billing.email' => 'required',
            'billing.town' => 'required',
            'billing.company_name' => 'nullable',
            'billing.street_address' => 'required',
            'billing.state' => 'required',
            'billing.zip' => 'nullable',
            'billing.note' => 'nullable',
            'billing.country_id' => 'required|integer',
            'billing.user_id' => 'nullable',
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
    public function messages()
    {
        return [
            'billing.first_name.required' => 'The first name field is required.',
            'billing.last_name.required' => 'The last name field is required.',
            'billing.phone.required' => 'The phone number field is required.',
            'billing.email.required' => 'The email field is required.',
            'billing.town.required' => 'The town field is required.',
            'billing.street_address.required' => 'The street address field is required.',
            'billing.state.required' => 'The first name field is required.',
            'billing.country_id.required' => 'The country field is required.',
            'billing.country_id.integer' => 'The country field shall be integer.',
        ];
    }
}
