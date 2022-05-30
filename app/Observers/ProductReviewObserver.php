<?php

namespace App\Observers;

use App\Jobs\LogJob;
use App\Models\ProductReview;
use App\Jobs\Products\ProductRateJob;
use Illuminate\Support\Facades\Queue;

class ProductReviewObserver
{
    public function created(ProductReview $productReview): void
    {
        Queue::push(new ProductRateJob($productReview->product_id));
    }

    public function delete(ProductReview $productReview): void
    {
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_product_review', $productReview->id));
    }
}
