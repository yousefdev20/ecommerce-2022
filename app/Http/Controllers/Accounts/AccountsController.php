<?php

namespace App\Http\Controllers\Accounts;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserChangePasswordRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class AccountsController extends Controller
{
    /**
     * @param User $user
     * @return JsonResponse
     */
    public function show(User $user): JsonResponse
    {
        return $this->response($user->load(['billing_addresses', 'shipping_addresses']));
    }

    /**
     * @param UserChangePasswordRequest $request
     * @return JsonResponse
     */
    public function changeUserPassword(User $user, UserChangePasswordRequest $request): JsonResponse
    {
        return $this->response($user->update(['password' => $request->password]));
    }
}
