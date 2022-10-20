<?php

namespace App\Http\Controllers;

use App\Models\Report;
use Illuminate\Http\JsonResponse;

class ReportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
    * Illuminate\Http\JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Report::query()->latest()->first());
    }
}
