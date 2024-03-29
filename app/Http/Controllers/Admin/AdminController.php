<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Admin;
use \Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreAdminRequest;
use App\Http\Requests\UpdateAdminRequest;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:add_admin')->only('store');
        $this->middleware('permission:show_admins')->only('index');
        $this->middleware('permission:delete_admin')->only('destroy');
        $this->middleware('permission:edit_admin|show_admins')->only(['show', 'update']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Admin::with(['roles'])->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreAdminRequest $request
     * @return JsonResponse
     */
    public function store(StoreAdminRequest $request): JsonResponse
    {
        return $this->response(Admin::query()->create($request->validated())?->roles()?->sync($request->roles ?? []));
    }

    /**
     * Display the specified resource.
     *
     * @param Admin $admin
     * @return JsonResponse
     */
    public function show(Admin $admin): JsonResponse
    {
        return $this->response($admin->load(['roles']));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateAdminRequest  $request
     * @param Admin $admin
     * @return JsonResponse
     */
    public function update(UpdateAdminRequest $request, Admin $admin): JsonResponse
    {
        $admin->roles()->sync($request->roles ?? [], true);
        $admin->update($request->except(['roles']));
        return $this->response($admin);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Admin  $admin
     * @return JsonResponse
     */
    public function destroy(Admin $admin): JsonResponse
    {
        return $this->response($admin->delete());
    }
}
