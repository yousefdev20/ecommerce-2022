<?php

namespace App\Repositories\Sizes;

use App\Models\Product\Size;
use Illuminate\Support\Facades\Cache;

class Sizes implements SizesInterface
{
    public function find(?string $name)
    {
        return collect($this->get())->where('name_en', $name)->first();
    }

    public function where(string $column, $value)
    {
        return collect($this->get())->where($column, $value)->first();
    }

    public function get()
    {
        return Cache::rememberForever('sizes', function () {
            return Size::all();
        });
    }

    public function store()
    {
        Cache::rememberForever('sizes', function () {
            return Size::all();
        });
    }

    public function delete()
    {
        Cache::forget('sizes');
    }

    public function refresh()
    {
        $this->delete();
        $this->store();
    }
}
