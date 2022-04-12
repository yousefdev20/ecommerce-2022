<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class ImageNotFoundRule implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
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
//        Storage::disk('local')->exists('public/products/2022-03-15/A4St0akGoHUfLbEcHT2H0xvgtCbqY4WeNjEsWs84.jpg'),
        return Storage::exists(str_replace(url('/') . '/', '', str_replace('storage', 'public', $value)));
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Image Not Found!.';
    }
}
