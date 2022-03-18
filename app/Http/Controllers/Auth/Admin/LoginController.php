<?php

namespace App\Http\Controllers\Auth\Admin;

use App\Models\Admin\Admin;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use App\Exceptions\Auth\CredentialsDosntMatch;
use App\Http\Requests\Auth\Admin\LoginRequest;

class LoginController extends Controller
{
    /**
     * @throws CredentialsDosntMatch
     */
    public function login(LoginRequest $request): JsonResponse
    {
        $admin = Admin::query()->where(['email' => $request->username])->first();
        if ($admin && Hash::check($request->password ?? '', $admin->password ?? null)) {
            $admin['token'] = $admin->createToken('admin')->plainTextToken;

            return $this->response($admin);
        }
        throw new CredentialsDosntMatch();
    }
}
