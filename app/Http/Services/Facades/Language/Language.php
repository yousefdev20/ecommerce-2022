<?php

namespace App\Http\Services\Facades\Language;

/**
 * @method static id()
 * @method static defaultLanguage()
 * @method static setLanguage(int $languageId)
 * @method static get()
 * @method static code()
 **/
class Language extends \Illuminate\Support\Facades\Facade
{
    protected static function getFacadeAccessor(): string
    {
        return "Language";
    }
}
