<?php

namespace App\Http\Requests;

use App\Rules\EditImageRule;
use App\Rules\MaxLevelOfCategoryRule;
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
            'image' => ['nullable', Rule::when($this->hasFile('image'),
                ['max:2048', 'dimensions:min_width=100,min_height=200', 'mimes:png']
            ), new EditImageRule()],
            'parent_id' => ['nullable', Rule::when($this->parent_id ?? false, ['exists:categories,id',
                new MaxLevelOfCategoryRule()])]
        ];
    }
}
