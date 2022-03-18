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
        $validation = false;
        if ($this?->slider === 'true' ?? true) {
            if (($this?->file('image')?->getMimeType() !== 'image/png')) {
                $validation = true;
            }
        }
        return [
            'name_en' => 'required',
            'name_ar' => 'required',
            'regular_price' => ['nullable', 'min:0', Rule::when(request('regular_price') ?? false, ['gt:sale_price'])],
            'sale_price' => ['required', 'numeric', 'min:0', Rule::when(request('regular_price') ?? false, ['lt:regular_price'])],
            'quantity' => 'required|integer|min:1',
            'image' => 'required|mimes:jpeg,png,gif,svg|max:2048|dimensions:min_width=100,min_height=200',
            'image_description' => 'nullable',
            'image_description.*' => [Rule::requiredIf(function () {
                return request('image_description') ?? false;
            }), 'mimes:jpeg,png,gif,svg', 'max:2048'],
            'currency_id' => 'required|exists:currencies,id',
            'category_id' => 'required|exists:categories,id',
            'slider' => ['nullable', Rule::when($validation, 'mimes:png')],
            'description_en' => 'required',
            'description_ar' => 'required',
            'sizes' => 'nullable|array',
            'sizes.*.size' => Rule::requiredIf(function () {
                return request('sizes') ?? false;
            }),
            'sizes.*.product_id' => Rule::requiredIf(function () {
                return request('sizes') ?? false;
            }),
            'colors_id' => 'nullable|array',
            'colors_id.*' => [Rule::requiredIf(function () {
                return request('colors') ?? false;
            }), 'exists:colors,id']
        ];
    }
    public function messages()
    {
        return [
            'image_description.*.mimes' => "The image description must be a file of type: jpeg, png, gif, svg.",
            'slider.mimes' => "To browse this product on main slider shall be the type of image (png)."
        ];
    }
}
