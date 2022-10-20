<?php

namespace App\Http\Requests;

use App\Rules\Products\SizeExistsRule;
use App\Rules\Products\UnitExistsRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateProductRequest extends FormRequest
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
        if ($this?->slider ?? true) {
            if ($this->hasFile('image')) {
                if (($this?->file('image')?->getMimeType() !== 'image/png')) {
                    $validation = true;
                }
            }
        }
        return [
            'name_en' => 'nullable',
            'name_ar' => 'nullable',
            'regular_price' => ['nullable','min:0', Rule::when(request('regular_price') ?? false, ['gt:sale_price'])],
            'sale_price' => ['required','numeric','min:0', Rule::when(request('regular_price') ?? false, ['lt:regular_price'])],
            'quantity' => 'nullable|integer|min:0',
            'image' => ['nullable'],
            'image_description' => 'nullable',
            'image_description.*' => [Rule::requiredIf(function () {
                return request('image_description') ?? false;
            }), 'mimes:jpeg,png,gif,svg', 'max:2048'],
            'currency_id' => 'nullable|exists:currencies,id',
            'category_id' => 'nullable|exists:categories,id',
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
            'product_description.weight' => 'nullable',
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
}
