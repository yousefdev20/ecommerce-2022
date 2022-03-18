<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCurrencyRequest extends FormRequest
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
            'name_ar' => 'required|unique:currencies,name_ar',
            'name_en' => 'required|unique:currencies,name_en',
            'code_ar' => 'required|unique:currencies,code_ar',
            'code_en' => 'required|unique:currencies,code_en',
            'exchange' => 'required|numeric',
        ];
    }
}
