<?php

namespace App\Repositories;

interface ISearchable
{
    public function find(string $name = '');
}
