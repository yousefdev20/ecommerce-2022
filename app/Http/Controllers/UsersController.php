<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\JsonResponse;

class UsersController extends Controller
{
    /**
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(User::query()->withTrashed()->simplePaginate(10));
    }

    /**
     * @param User $user
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
     * @return JsonResponse
     */
    public function destroy(User $user): JsonResponse
    {
        return $this->response($user->delete());
    }
}
