<?php

namespace App\Observers;

use App\Jobs\Products\ProductRateJob;
use App\Models\ProductReview;
use Illuminate\Support\Facades\Queue;

class ProductReviewObserver
{
    public function created(ProductReview $productReview)
    {
        Queue::push(new ProductRateJob($productReview->product_id));
    }
}
