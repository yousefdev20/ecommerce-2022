<?php

namespace App\Rules;

use App\Repositories\Category\CategoriesRepository;
use Illuminate\Contracts\Validation\Rule;

class MaxLevelOfCategoryRule implements Rule
{

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value): bool
    {
        return ($this->getLevelOfCategory((int)$value) + 1) <= (config('category.max-level') ?? 0);
    }

    /**
     * Get the validation error message.
     *
     * @return string|int
     */
    public function message(): int|string
    {
        return 'The max level of child category is ' . config('category.max-level') ?? 0;
    }

    private function getLevelOfCategory(int $id)
    {
        return (new CategoriesRepository())->where('id', $id)['level'] ?? 0;

    }
}
