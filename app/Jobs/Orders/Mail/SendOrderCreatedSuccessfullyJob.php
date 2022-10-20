<?php

namespace App\Jobs\Orders\Mail;

use App\Models\Order\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Mail;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use App\Mail\Orders\OrderCreatedSuccessfully;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use App\Http\Services\Facades\Currencies\Currency;
use App\Repositories\Currencies\CurrencyInterface;


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
     * @param CurrencyInterface $currency
     * @return void
     */
    public function handle(CurrencyInterface $currency): void
    {
        Currency::setCurrency($this?->order?->currency_id);
        $order = Order::with(['products', 'billingAddress', 'user'])->find($this->order->id);
        $to = $order?->user?->email ?? $order?->billing_address?->email ?? '';
        Mail::to($to)->send(new OrderCreatedSuccessfully($order));
    }
}
