<?php

namespace App\Http\Controllers\Product;

use App\Models\Product\Product;
use App\Models\Slider;
use App\Repositories\Products\TopSelling\TopSellingProductInterface;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Product\ProductDescription;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use Illuminate\Support\Facades\Storage;

class ProductsController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        // Admin response
        if (auth()?->check() ?? false) {
            return $this->response(Product::query()->simplePaginate(9));
        }
        return $this->response(Product::query()->inStock()->simplePaginate(9));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param StoreProductRequest $request
     * @return JsonResponse
     */
    public function store(StoreProductRequest $request): JsonResponse
    {
        /**
         * init ProductDescription Object
         */
        $product = Product::query();
        $product_description = ProductDescription::query();

        DB::transaction(function () use ($request, $product_description, $product){
            /**
             * store product image.
             */
            $path = $request->file('image')->store('public/products/' . date('Y-m-d'));
            /**
             * Here the data it will be stored inside Products records.
             */
            $data = [$request->except(['description_ar', 'description_en', 'image_description', 'image']) + ['image' => $path]];
            /**
             * handel the image details for each item (product)
             */
            $images = [];
            foreach ($request->image_description ?? [] as $image) {
                $images[] = ['path' => Storage::put('public/products/description/' . date('Y-m-d'), $image)];
            }

            /**
             * store description and product
             */
            $product_description = $product_description->create($request->only(['description_ar', 'description_en']));
            $product = $product->create($data[0] + ['product_description_id' => $product_description->id]);
            /**
             * store product details (images)
             */
            if ($request->image_description ?? false) {
                foreach ($images as $image) {
                    $product?->images()?->create($image);
                }
            }
            /**
             * store product details (colors)
             */
            if ($request->colors_id ?? false) {
                $product?->colors()?->attach($request->colors_id);
            }

            /**
             * store this product on slider table if asked from admin.
             */
            if ($request?->slider === 'true' ?? true) {
                $product?->slider()?->create();
            }
        });

        /**
         * response
         */
        return $this->response($product);
    }

    /**
     * Display the specified resource.
     *
     * @param Product $product
     * @return JsonResponse
     */
    public function show(Product $product): JsonResponse
    {
        return $this->response(
            $product->load(['sizes', 'images', 'colors', 'description', 'category', 'currency', 'slider'])
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  UpdateProductRequest  $request
     * @param  Product  $product
     * @return JsonResponse
     */
    public function update(UpdateProductRequest $request, Product $product): JsonResponse
    {
        /**
         * init ProductDescription Object
         */

        DB::transaction(function () use ($request, $product) {

            /**
             * Here the data it will be stored inside Products records.
             */
            $data = [$request->only(['name_ar', 'name_en', 'regular_price', 'sale_price',
                'quantity', 'currency_id', 'category_id'
                ])];
            /**
             * store product image.
             */
            if ($request->hasFile('image')) {
                $path = $request->file('image')->store('public/products/' . date('Y-m-d'));
                $data[0]['image'] = $path;
            }

            /**
             * handel the image details for each item (product)
             */
            $images = [];
            foreach ($request->image_description ?? [] as $image) {
                $images[] = ['path' => Storage::put('public/products/description/' . date('Y-m-d'), $image)];
            }

            /**
             * store description and product
             */
            $product->update($data[0]);

            $product->description()
                ->update($request->only(['description_ar', 'description_en']));
            /**
             * store product details (images)
             */
            if ($request->image_description ?? false) {
                $product?->images()?->delete();
                foreach ($images as $image) {
                    $product?->images()?->create($image);
                }
            }
            /**
             * store product details (colors)
             */
            $product->colors()->detach();
            if ($request->colors_id ?? false) {
                $product?->colors()?->attach($request->colors_id);
            }

            /**
             * store this product on slider table if asked from admin otherwise delete.
             */
            if ($request?->slider === 'true' ?? true) {
                $product?->slider()?->updateOrCreate(['product_id' => $product->id]);
            } else {
                $product?->slider()?->delete();
            }
        });

        /**
         * response
         */
        return $this->response($product);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Product  $product
     * @return JsonResponse
     */
    public function destroy(Product $product): JsonResponse
    {
        Storage::delete($product->image);
        Storage::delete($product->load(['images']));
        return $this->response($product->delete());
    }

    /**
     * get the latest (8) product from storage.
     *
     * @return JsonResponse
     */
    public function latestProduct(int $count = 8): JsonResponse
    {
        return $this->response(Product::query()->inStock()->latest()->with(['currency'])->limit($count)->get());
    }

    /**
     * get the latest (8) product from storage.
     *
     * @return JsonResponse
     */
    public function bestSelling(int $count = 8): JsonResponse
    {
        $products = DB::table('order_product')
            ->where('quantity', '>=', 1)
            ->select(DB::raw('count(product_id) as count, product_id'))
            ->limit($count)->get();
        return $this->response($products);
    }

    /**
     * Load Products Base on Filter (Category, Color, Price)
     *
     * @param Request
     * @return JsonResponse
     */
    public function getProducts(Request $request): JsonResponse
    {
        $products = Product::query()->inStock();

        # Category
        if ($request->category) {
            $products->with(['currency'])->whereHas('category', function ($query) use ($request) {
                $query->where('id', $request->category);
            });
        }
        # Colors
        if ($request->color) {
            $products->with(['colors'])->whereHas('colors', function ($query) use ($request) {
                $query->where('color_id', $request->color);
            });
        }
        # Price [from-to]
        if ($request->to) {
            $products->whereBetween('sale_price', [$request->from ?? 0, $request->to]);
        }
        return $this->response($products->simplePaginate(9));
    }

    public function topSelling(TopSellingProductInterface $products): JsonResponse
    {
        return $this->response($products->get());
    }

    public function slider(): JsonResponse
    {
        return $this->response(Slider::query()->with(['product.description'])->get());
    }

    public function search(string $search): JsonResponse
    {
        return $this->response(Product::query()->inStock()->where('name_en', 'LIKE', '%' . $search . '%')->get());
    }
}
