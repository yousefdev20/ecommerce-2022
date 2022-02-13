<?php

namespace App\Http\Controllers\Auth\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\Admin\LoginRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(LoginRequest $request): \Illuminate\Http\JsonResponse
    {
        if (!Auth::attempt($request->validated())) {

            return $this->response(null, 'These credentials do not match our records.', 401);
        }
        $user = auth()->user();
        $user->createToken('user')->plainTextToken;

        return $this->response($user);
    }
}
