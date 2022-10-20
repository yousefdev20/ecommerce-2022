<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Spatie\Permission\Models\Role;
use App\Http\Requests\StoreRoleRequest;
use App\Http\Requests\UpdateRoleRequest;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:add_role')->only('store');
        $this->middleware('permission:show_roles')->only('index');
        $this->middleware('permission:delete_role')->only('destroy');
        $this->middleware('permission:edit_role|show_roles')->only(['show', 'update']);
    }

    public function index(): JsonResponse
    {
        return $this->response(Role::with(['permissions'])->get());
    }

    public function store(StoreRoleRequest $request): JsonResponse
    {
        return $this->response(Role::create($request->only('name'))->permissions()->sync($request->permissions ?? []));
    }

    public function show(Role $role): JsonResponse
    {
        return $this->response($role->load(['permissions']));
    }

    public function update(Role $role, UpdateRoleRequest $request): JsonResponse
    {
        $role->permissions()->detach();
        $role->permissions()->sync($request->permissions ?? []);
        return $this->response($role->update($request->only('name')));
    }

    public function destroy(Role $role): JsonResponse
    {
        return $this->response($role->delete());
    }
}
