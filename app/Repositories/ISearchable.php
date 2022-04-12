<?php

namespace App\Repositories;

interface ISearchable
{
    public function find(string|null $name);
    public function where(string $column = 'id', $value);
}
