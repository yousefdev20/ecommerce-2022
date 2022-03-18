<?php

namespace App\Http\Requests;

use App\Rules\QuantityIsEnough;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateExclusiveProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
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
            'product_id' => [
                'required', 'exists:products,id', new QuantityIsEnough(),
                Rule::unique('exclusive_products')->ignore(request('id'))
            ],
            'expiration_date' => 'required|date'
        ];
    }

    protected function prepareForValidation()
    {
        $this->merge([
            'expiration_date' => date('Y-m-d H:i:s', strtotime(request('expiration_date'))),
        ]);
    }
}
