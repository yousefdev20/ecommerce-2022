<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateCurrencyRequest extends FormRequest
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
            'name_en' => ['nullable', Rule::unique('currencies')->ignore(request('id'))],
            'name_ar' => ['nullable', Rule::unique('currencies')->ignore(request('id'))],
            'code_ar' => ['nullable', Rule::unique('currencies')->ignore(request('id'))],
            'code_en' => ['nullable', Rule::unique('currencies')->ignore(request('id'))],
            'exchange' => 'nullable|numeric',
        ];
    }
}
