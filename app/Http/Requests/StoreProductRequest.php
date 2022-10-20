<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;
use App\Rules\Products\SizeExistsRule;
use App\Rules\Products\UnitExistsRule;
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
            'sale_unit' => ['nullable', new UnitExistsRule()],
            'kg' => ['nullable', Rule::requiredIf($this->sale_unit == 1), 'integer', 'min:0'],
            'pieces' => ['nullable', Rule::requiredIf($this->sale_unit == 2), 'integer', 'min:0'],
            'package_items.*' => ['array', 'min:1'],
            'package_items.*.description' => [Rule::requiredIf($this->package_items ?? false)],
            'slider' => ['nullable', Rule::when($validation, 'mimes:png')],
            'product_description.description_en' => 'nullable',
            'product_description.description_ar' => 'nullable',
            'product_description.width' => 'nullable',
            'product_description.height' => 'nullable',
            'product_description.depth' => 'nullable',
            'colors_id' => 'nullable|array',
            'colors_id.*' => [Rule::requiredIf(function () {
                return request('colors') ?? false;
            }), 'exists:colors,id'],
            'sizes_id' => 'nullable|array',
            'sizes_id.*' => [Rule::requiredIf(function () {
                return request('sizes_id') ?? false;
            }), new SizeExistsRule()]
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
