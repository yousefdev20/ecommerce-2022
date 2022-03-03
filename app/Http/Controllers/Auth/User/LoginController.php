<?php

namespace App\Http\Controllers\Auth\User;

use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
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
        if (!Auth::attempt($this->credentials($request))) {
            throw new CredentialsDosntMatch();
        }
        $user = auth()->user();
        $user['token'] = $user?->createToken('user')->plainTextToken;

        return $this->response($user);
    }

    /**
     * This method to determine what the username field used to Login (username, phone, email)
     * @return string
     */
    protected function username(): string
    {
        if (filter_var(request('username'), FILTER_VALIDATE_EMAIL))
        {
            return 'email';
        }
        if (filter_var(request('username'), FILTER_VALIDATE_INT))
        {
            return 'phone';
        }
        return 'first_name';
    }

    private function credentials(LoginRequest $request): array
    {
        $username = $this->username();
//        if ($username === 'email') {
//            return [$username => Crypt::encryptString($request?->username), 'password' => $request?->password];
//        }
        return [$username => $request?->username, 'password' => $request?->password];
    }
}
