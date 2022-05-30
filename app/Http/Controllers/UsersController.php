<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateUserRequest;
use App\Models\User;
use Illuminate\Http\JsonResponse;

class UsersController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:show_users')->only('index');
        $this->middleware('permission:delete_user')->only(['destroy', 'unblock']);
    }

    /**
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(User::query()->withTrashed()->simplePaginate(10));
    }

    /**
     * @param $id
     * @return JsonResponse
     */
    public function unblock($id): JsonResponse
    {
        return $this->response(User::withTrashed()?->find($id)?->restore());
    }

    /**
     * @param User $user
     * @return JsonResponse
     */
    public function show(User $user): JsonResponse
    {
        return $this->response($user);
    }

    /**
     * @param User $user
     * @param UpdateUserRequest $request
     * @return JsonResponse
     */
    public function update(User $user, UpdateUserRequest $request): JsonResponse
    {
        return $this->response($user->update($request->validated()));
    }

    /**
     * @param User $user
     * @return JsonResponse
     */
    public function destroy(User $user): JsonResponse
    {
        return $this->response($user->delete());
    }
}
