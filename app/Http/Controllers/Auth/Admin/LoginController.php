<?php

namespace App\Http\Controllers\Auth\Admin;

use App\Models\Admin\Admin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\Admin\LoginRequest;

class LoginController extends Controller
{
    public function login(LoginRequest $request): \Illuminate\Http\JsonResponse
    {
        $admin = Admin::query()->where($request->only('email'))->first();
        if (!$admin && !Hash::check($request->password ?? '', $admin->password ?? null)) {

            return $this->response(null, 'These credentials do not match our records.', 401);
        }

        $admin['token'] = $admin->createToken('admin')->plainTextToken;
        return $this->response($admin);
    }
}
