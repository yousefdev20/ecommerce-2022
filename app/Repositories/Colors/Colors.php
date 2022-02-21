<?php

namespace App\Repositories\Colors;

use App\Models\Product\Color;
use Illuminate\Support\Facades\Cache;

class Colors implements ColorsInterface
{

    public function get()
    {
        return Cache::rememberForever('colors', function (){
            return Color::all();
        });
    }

    public function store()
    {
        Cache::rememberForever('colors', function (){
            return Color::all();
        });
    }

    public function find(string $name = '')
    {
        return collect($this->get())->where('name', '=', $name)->first() ??
            collect($this->get())->where('name', '=', 'red')->first();
    }

    public function delete()
    {
        return Cache::forget('colors');
    }

    public function refresh()
    {
        $this->delete();
        $this->store();
    }
}
