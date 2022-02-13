<?php

namespace App\Http\Requests;

use App\Rules\Products\StoreSizeRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreProductRequest extends FormRequest
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
            'name_en' => 'required',
            'name_ar' => 'required',
            'regular_price' => 'nullable',
            'sale_price' => 'required|numeric|min:0',
            'quantity' => 'nullable',
            'image' => 'required',
            'currency_id' => 'required',
            'category_id' => 'required',
            'description_en' => 'required',
            'description_ar' => 'required',
            'sizes' => 'nullable|array',
            'sizes.*.size' => Rule::requiredIf(function () {
                return request('sizes') ?? false;
            }),
            'sizes.*.product_id' => Rule::requiredIf(function () {
                return request('sizes') ?? false;
            }),
            'colors' => 'nullable|array',
            'colors.*.color_id' => [Rule::requiredIf(function () {
                return request('colors') ?? false;
            }), 'exists:colors,id'],
            'colors.*.product_id' => [Rule::requiredIf(function () {
                return request('colors') ?? false;
            }), 'exists:colors,id'],
        ];
    }
}
