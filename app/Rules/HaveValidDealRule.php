<?php

namespace App\Rules;

use App\Models\Deal\Deal;
use Illuminate\Contracts\Validation\Rule;

class HaveValidDealRule implements Rule
{
    /**
     * @param $attribute
     * @param $value
     * @return bool
     * @throws \Laravel\Octane\Exceptions\DdException
     */
    public function passes($attribute, $value)
    {
        return (!Deal::query()->where('id', '!=', request('id'))->thisWeek()->exists());
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Already have valid Deal.';
    }
}
