<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProductFavoriteRequest;
use App\Http\Requests\UpdateProductFavoriteRequest;
use App\Models\ProductFavorite;

class ProductFavoriteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreProductFavoriteRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreProductFavoriteRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ProductFavorite  $productFavorite
     * @return \Illuminate\Http\Response
     */
    public function show(ProductFavorite $productFavorite)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ProductFavorite  $productFavorite
     * @return \Illuminate\Http\Response
     */
    public function edit(ProductFavorite $productFavorite)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateProductFavoriteRequest  $request
     * @param  \App\Models\ProductFavorite  $productFavorite
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateProductFavoriteRequest $request, ProductFavorite $productFavorite)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ProductFavorite  $productFavorite
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProductFavorite $productFavorite)
    {
        //
    }
}
