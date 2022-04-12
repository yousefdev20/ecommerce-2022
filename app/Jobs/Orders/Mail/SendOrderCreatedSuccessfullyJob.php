<?php

namespace App\Jobs\Orders\Mail;

use App\Mail\Orders\OrderCreatedSuccessfully;
use App\Models\Order\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class SendOrderCreatedSuccessfullyJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public Order $order;
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
    public function handle()
    {
        if ($this?->order?->user()?->email ?? false) {
            Mail::to($this?->order?->user()?->email)
                ->send(new OrderCreatedSuccessfully());
        } else {
            Mail::to($this?->order?->billingAddress()?->email)
                ->send(new OrderCreatedSuccessfully());
        }
    }
}
