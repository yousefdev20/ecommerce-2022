<?php

namespace App\Http\Controllers\Order;

use App\Models\Order\Workflow;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreWorkflowRequest;
use App\Http\Requests\UpdateWorkflowRequest;

class WorkflowsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Workflow::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreWorkflowRequest  $request
     * @return JsonResponse
     */
    public function store(StoreWorkflowRequest $request): JsonResponse
    {
        return $this->response(Workflow::query()->create($request->validated()));
    }

    /**
     * Display the specified resource.
     *
     * @param  Workflow  $workflow
     * @return JsonResponse
     */
    public function show(Workflow $workflow): JsonResponse
    {
        return $this->response($workflow);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateWorkflowRequest  $request
     * @param  Workflow  $workflow
     * @return JsonResponse
     */
    public function update(UpdateWorkflowRequest $request, Workflow $workflow): JsonResponse
    {
        return $this->response($workflow::query()->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Workflow  $workflow
     * @return JsonResponse
     */
    public function destroy(Workflow $workflow): JsonResponse
    {
        return $this->response($workflow->delete());
    }
}
