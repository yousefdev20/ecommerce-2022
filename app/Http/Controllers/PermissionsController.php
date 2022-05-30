<?php

namespace App\Http\Controllers;

use Spatie\Permission\Models\Permission;

class PermissionsController extends Controller
{
    public function index(): \Illuminate\Http\JsonResponse
    {
        return $this->response(Permission::all());
    }
}
