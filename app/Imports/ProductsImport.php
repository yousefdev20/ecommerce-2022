<?php

namespace App\Imports;

use App\Models\Product\Product;
use App\Models\Product\ProductDescription;
use App\Rules\ImageNotFoundRule;
use App\Rules\Products\ImportCSV\ConvertColorsToArrayAndCheckRule;
use App\Rules\Products\SizeExistsRule;
use App\Rules\Products\UnitExistsRule;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithProgressBar;

class ProductsImport implements ToModel, WithHeadingRow, WithValidation, WithProgressBar
{
    use Importable;
    protected array $row = [];
    protected array $colors = [];
    /**
     * @param array $row
     * @return Product
     */
    public function model(array $row)
    {
        $this->row = $row;
        $sizes = [];
        $packageItems = [];
        if ($row['colors_id'] ?? false) {
            $this->colors = explode(',', str_replace(' ', '', $row['colors_id']));
        }
        if (($row['package_items'] ?? false) && $row['sale_unit'] == 3) {
            $data = explode(',', str_replace(' ', '', $row['package_items']));
            foreach ($data ?? [] as $item) {
                $packageItems[]['description'] = $item;
            }
        }
        if ($row['sizes'] ?? false) {
            foreach (explode(',', str_replace(' ', '', $row['sizes'])) ?? [] as $item) {
                foreach (config('product.sizes') as $unit) {
                    if (strtolower($item) == strtolower($unit['name_en']) ?? '') {
                        $sizes[] = $unit['id'];
                    }
                }
            }
        }
        $product_description = ProductDescription::query() ->create([
                'description_en' => $row['description_en'], 'description_ar' => $row['description_ar'],
                'width' => $row['width'] ?? '', 'height' => $row['height'] ?? '', 'depth' => $row['depth'] ?? ''
            ]);
        $data = [
            'name_en' => $row['name_en'],
            'name_ar' => $row['name_ar'],
            'sale_price' => $row['sale_price'],
            'regular_price' => $row['regular_price'],
            'quantity' => $row['quantity'],
            'image' => $row['image'],
            'currency_id' => $row['currency_id'],
            'category_id' => $row['category_id'],
            'product_description_id' => $product_description->id,
            'kg' => $row['kg'] ?? '',
            'pieces' => $row['pieces'] ?? '',
        ];
        if ($row['sale_unit'] ?? false) {
            $data['sale_unit'] = $row['sale_unit'];
        }
        $product =  Product::query()->create($data);

        if (($row['package_items'] ?? false) && $row['sale_unit'] == 3) {
            $product?->package()->create()->items()->createMany($packageItems ?? []);
        }

        if ($this->colors ?? false) {
            $product?->colors()?->attach($this->colors ?? []);
        }
        foreach ($sizes ?? [] as $size) {
            $product?->sizes()?->create(['size' => $size]);
        }
    }

    /**
     * @return array
     */
    public function rules(): array
    {
        $row = $this->row;
        return [
            'name_en' => 'required',
            'name_ar' => 'required',
            'sale_price' => ['required', 'numeric', 'min:0', Rule::when($row['regular_price'] ?? false, ['lt:regular_price'])],
            'regular_price' => ['nullable', 'min:0', Rule::when($row['regular_price'] ?? false, ['gt:sale_price'])],
            'quantity' => 'required|integer|min:1',
            'image' => ['required', new ImageNotFoundRule()],
            'currency_id' => 'required|exists:currencies,id',
            'category_id' => 'required|exists:categories,id',
            'colors_id' => ['nullable', new ConvertColorsToArrayAndCheckRule()],
            'sale_unit' => ['nullable', new UnitExistsRule()],
            'kg' => ['nullable', Rule::requiredIf(($row['sale_unit'] ?? -1) == 1), 'integer', 'min:0'],
            'pieces' => ['nullable', Rule::requiredIf(($row['sale_unit'] ?? -1) == 2), 'integer', 'min:0'],
            'package' => ['nullable'],
            'package.items' => ['nullable', 'array'],
            'sizes_id' => 'nullable|array',
            'sizes_id.*' => [Rule::requiredIf(function () {
                return request('sizes_id') ?? false;
            })],
            'package_items' => [Rule::requiredIf(($row['sale_unit'] ?? -1) == '3')],
            'description_en' => 'nullable',
            'description_ar' => 'nullable',
            'width' => 'nullable|integer|min:0',
            'height' => 'nullable|integer|min:0',
            'depth' => 'nullable|integer|min:0',
        ];
    }
}
