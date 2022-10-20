<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Media extends Model
{
    use HasFactory;

    protected $fillable = ['path', 'type', 'name', 'description'];

    public function imageable()
    {
        return $this->morphTo();
    }

    public function getPathAttribute($value): string|\Illuminate\Contracts\Routing\UrlGenerator|\Illuminate\Contracts\Foundation\Application
    {
        return url(str_replace('public', 'storage', $value));
    }
}
