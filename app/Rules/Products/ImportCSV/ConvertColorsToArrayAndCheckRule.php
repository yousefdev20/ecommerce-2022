<?php

namespace App\Rules\Products\ImportCSV;

use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Facades\DB;

class ConvertColorsToArrayAndCheckRule implements Rule
{
    public array $colors = [];
    public array $errors = [];
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->colors = $colors;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $this->colors = explode(',', str_replace(' ', '', $value));

        foreach ($this->colors as $color) {
            if (!DB::table('colors')->where('id', $color)->exists()) {
                $this->errors[] = $color;
            }
        }
        return count($this->errors ?? []) <= 0;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message(): string
    {
        return 'The color id ('. implode(',', $this->errors) .') dos`nt exists';
    }
}
