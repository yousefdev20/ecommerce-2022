<?php

namespace App\Http\Requests;

use App\Rules\HaveValidDealRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateDealRequest extends FormRequest
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
            'expiration_date' => ['required', 'date', new HaveValidDealRule()],
            'product_id' => 'array|required|min:1',
            'product_id.*' => ['nullable', 'exists:products,id']
        ];
    }

    protected function prepareForValidation()
    {
        $this->merge([
            'expiration_date' => date('Y-m-d H:i:s', strtotime(request('expiration_date'))),
        ]);
    }
}
