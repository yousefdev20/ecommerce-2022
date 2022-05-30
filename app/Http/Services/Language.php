<?php

namespace App\Http\Services;

use App\Models\Language as LanguageModel;

class Language
{
    private LanguageModel|null $language = null;
    protected string|null $currentLanguageCode;

    public function __construct()
    {
        $this->currentLanguageCode = request()->header('lang') ?? config('language.default_language');
        $this->language = $this->defaultLanguage();
    }

    public function defaultLanguage(): LanguageModel|\Illuminate\Database\Eloquent\Builder|null
    {
        return LanguageModel::query()->where('code', $this->currentLanguageCode)->first();
    }

    public function setLanguage(int $languageId): void
    {
        $this->language = LanguageModel::query()->find($languageId)->first();
    }

    public function setLanguageByCode(string $code): void
    {
        $this->language = LanguageModel::query()->where('code', $code)->first();
    }

    public function get(): ?LanguageModel
    {
        return $this->language ?? $this->defaultLanguage();
    }

    public function id()
    {
        return $this->language->id;
    }

    public function code(): string
    {
        return strtolower($this->language->code ?? 'en');
    }
}
