<?php

namespace App\Jobs\Orders\Mail;

use App\Models\Order\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Mail;
use Illuminate\Queue\SerializesModels;
use App\Mail\Orders\OrderStatusChanged;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Contracts\Queue\ShouldBeUnique;

class SendOrderStatusChangedSuccessfully implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private Order $order;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(Order $order)
    {
        $this->order = $order;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle(): void
    {
        if ($this?->order?->user?->email ?? false) {
            Mail::to($this?->order?->user?->email)
                ->send(new OrderStatusChanged($this->order));
        } else {
            Mail::to($this?->order?->load('billingAddress')->billingAddress()?->email)
                ->send(new OrderStatusChanged($this->order));
        }
    }
}
