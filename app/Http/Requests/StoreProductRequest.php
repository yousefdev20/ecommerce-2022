<?php

namespace App\Http\Requests;

use App\Rules\Products\StoreSizeRule;
use Illuminate\Foundation\Http\FormRequest;

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
            'sizes' => [new StoreSizeRule],
//            'sizes' => 'array|nullable',
//            'sizes.size' => 'array|nullable',
//            'sizes.product_id' => 'array|nullable',
            'colors' => 'nullable'
        ];
    }
}
