<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreMediaRequest extends FormRequest
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
            'images' => ['array', 'max:10'],
            'images.*' => 'required|mimes:jpeg,png,gif,svg|max:2048|dimensions:min_width=100,min_height=200',
            'type' => 'nullable',
            'name' => 'nullable',
            'description' => 'nullable'
        ];
    }
}
