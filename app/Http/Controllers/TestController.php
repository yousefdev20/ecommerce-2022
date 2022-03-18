<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestController extends Controller
{
    public function index(Request $request)
    {
        return [
            'has' => $request->hasFile('image'),
            'image' => $request->image
        ];
    }
}
