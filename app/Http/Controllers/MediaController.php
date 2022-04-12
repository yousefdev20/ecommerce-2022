<?php

namespace App\Http\Controllers;

use App\Models\Media;
use Illuminate\Http\JsonResponse;
use App\Http\Requests\StoreMediaRequest;
use App\Http\Requests\UpdateMediaRequest;
use Illuminate\Support\Facades\Storage;

class MediaController extends Controller
{
    public function __construct()
    {
//        $this->middleware(["permission:show_media"]);
    }

    /**
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->response(Media::query()->simplePaginate(10));
    }

    /**
     * @param StoreMediaRequest $request
     * @return JsonResponse
     */
    public function store(StoreMediaRequest $request): JsonResponse
    {
        $data = [];
        if ($request->hasFile('images')) {
            foreach ($request->images ?? [] as $image) {
                $data[] = ['path' => Storage::put('public/media/' . date('Y-m-d'), $image)];
            }
        }
        return $this->response(Media::query()->insert($data));
    }

    /**
     * @param Media $media
     * @return JsonResponse
     */
    public function show(Media $media): JsonResponse
    {
        return $this->response();
    }

    /**
     * @param UpdateMediaRequest $request
     * @param Media $media
     * @return JsonResponse
     */
    public function update(UpdateMediaRequest $request, Media $media): JsonResponse
    {
        return $this->response();
    }

    /**
     * @param Media $media
     * @return JsonResponse
     */
    public function destroy($id): JsonResponse
    {
        return $this->response(Media::find($id)->delete());
    }
}
