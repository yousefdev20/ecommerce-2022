<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateCountryRequest extends FormRequest
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
            'name_en' => ['required', Rule::unique('countries', 'name_en')->ignore($this->id)],
            'name_ar' => ['required', Rule::unique('countries', 'name_ar')->ignore($this->id)],
            'code_en' => ['required', Rule::unique('countries', 'code_en')->ignore($this->id)],
            'code_ar' => ['required', Rule::unique('countries', 'code_ar')->ignore($this->id)],
        ];
    }
}
