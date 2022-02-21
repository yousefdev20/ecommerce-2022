<?php

namespace App\Repositories;

interface IStorable
{
    public function get();
    public function store();
    public function delete();
    public function refresh();
}
