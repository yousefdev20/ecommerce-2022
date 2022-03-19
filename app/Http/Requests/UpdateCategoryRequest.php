<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateCategoryRequest extends FormRequest
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
            'name_ar' => ['nullable', Rule::unique('categories')->ignore(request('id'))],
            'name_en' => ['nullable', Rule::unique('categories')->ignore(request('id'))],
            'image' => 'nullable|mimes:png|max:2048|dimensions:min_width=100,min_height=200',
            'parent_id' => Rule::when(request('parent_id') ?? false, ['exists:categories,id'])
        ];
    }
}
