<?php

namespace App\Observers;

use App\Models\Order\Order;
use App\Models\Product\Product;
use Illuminate\Support\Facades\Queue;
use App\Http\Services\Facades\Cart\Cart;
use App\Jobs\Orders\Mail\SendOrderCreatedSuccessfullyJob;

class OrderObserver
{
    public function created(Order $order)
    {
        // Push email job
        $items = Cart::productOrderAttach(request('order') ?? []);
        foreach ($items ?? [] as $item) {
            Product::query()?->where('id', $item['product_id'] ?? 0)
                ?->decrement('quantity', 1);
        }
        Queue::push(new SendOrderCreatedSuccessfullyJob($order));
    }

    public function updated(Order $order)
    {
        if ($order->isDirty('status')) {

            if ($order?->status == 3 || $order?->status == 5) {
                if (($order?->paid_status == 0) ?? false) {
                    $order->update(['paid_status' => '1']);
                }
                $order->invoice()
                    ->updateOrCreate(
                        ['order_id' => $order->id, 'user_id' => $order?->user_id],['user_id' => $order?->user_id]
                    );
            }else {
                $order->invoice()->delete();
                if (($order?->paid_status == 1) ?? false) {
                    $order->update(['paid_status' => '0']);
                }
            }
        }
    }
}
