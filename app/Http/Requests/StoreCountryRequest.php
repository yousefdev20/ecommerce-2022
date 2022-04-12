<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCountryRequest extends FormRequest
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
            'name_en' => 'required|unique:countries,name_en',
            'name_ar' => 'required|unique:countries,name_ar',
            'code_en' => 'required|unique:countries,code_en',
            'code_ar' => 'required|unique:countries,code_ar',
        ];
    }
}
