<?php

namespace App\Repositories\Exclusives;

use App\Models\Product\ExclusiveProduct;
use Illuminate\Support\Facades\Cache;

class ExclusiveRepository implements ExclusivesRepositoryInterface
{
    public function get()
    {
        return Cache::rememberForever('exclusives', function () {
            return ExclusiveProduct::all();
        });
    }

    public function store()
    {
        Cache::rememberForever('exclusives',  function () {
            return ExclusiveProduct::all();
        });
    }

    public function delete(): bool
    {
        return Cache::forget('exclusives');
    }

    public function refresh()
    {
        $this->delete();
        $this->store();
    }
}
