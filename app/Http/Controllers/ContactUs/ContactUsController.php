<?php

namespace App\Http\Controllers\ContactUs;

use App\Models\ContactUs;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreContactUsRequest;
use App\Http\Requests\UpdateContactUsRequest;

class ContactUsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(ContactUs::query()->simplePaginate(10));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreContactUsRequest $request
     * @return JsonResponse
     */
    public function store(StoreContactUsRequest $request): JsonResponse
    {
        return $this->response(ContactUs::query()->create($request->validated()));
    }

    /**
     * Display the specified resource.
     *
     * @param ContactUs $contactUs
     * @return JsonResponse
     */
    public function show(ContactUs $contactUs): JsonResponse
    {
        return $this->response($contactUs);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateContactUsRequest $request
     * @param ContactUs $contactUs
     * @return JsonResponse
     */
    public function update(UpdateContactUsRequest $request, ContactUs $contactUs): JsonResponse
    {
        return $this->response($contactUs->update($request->validated()));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param ContactUs $contactUs
     * @return JsonResponse
     */
    public function destroy(ContactUs $contactUs): JsonResponse
    {
        return $this->response($contactUs->delete());
    }
}
