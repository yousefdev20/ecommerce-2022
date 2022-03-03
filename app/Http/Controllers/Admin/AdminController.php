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
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Admin::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreAdminRequest  $request
     * @return JsonResponse
     */
    public function store(StoreAdminRequest $request): JsonResponse
    {
        return $this->response(Admin::query()->create(
            $request->validated()  + ['password' => Hash::make($request->password)])
        );
    }

    /**
     * Display the specified resource.
     *
     * @param Admin $admin
     * @return JsonResponse
     */
    public function show(Admin $admin): JsonResponse
    {
        return $this->response($admin);
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
        return $this->response($admin::query()->update($request->validated()));
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
