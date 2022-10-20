<?php

namespace App\Http\Requests;

use App\Rules\MaxLevelOfCategoryRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreCategoryRequest extends FormRequest
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
            'name_ar' => 'required|unique:categories',
            'name_en' => 'required|unique:categories',
            'image' => 'required|mimes:png|max:2048|dimensions:min_width=100,min_height=200',
            'parent_id' => Rule::when(request('parent_id') ?? false, ['exists:categories,id',
                new MaxLevelOfCategoryRule()])
        ];
    }
}
