<?php

namespace App\Exceptions;

use App\Exceptions\Auth\CredentialsDosntMatch;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Support\Facades\Response;
use Throwable;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array<int, class-string<Throwable>>
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });

        $this->renderable(function (CredentialsDosntMatch $exception, $request){
            return Response::json(['data' => null, 'message' => 'These credentials do not match our records.'], 422);
        });

        $this->renderable(function (DefaultCurrencyDosntExist $exception, $request){
            return Response::json(['data' => null, 'message' => 'The default currency dos`nt exist, search on it
            via currency config file and matched on database'], 422);
        });
    }
}
