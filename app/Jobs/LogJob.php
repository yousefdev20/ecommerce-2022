<?php

namespace App\Jobs;

use App\Models\Log;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class LogJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private $payload;
    private int $user_id;
    private string $action;

    /**
     * Create a new job instance.
     *
     * @param int $user_id
     * @param string $action
     * @param $payload
     */
    public function __construct(int $user_id, string $action, $payload)
    {
        $this->user_id = $user_id;
        $this->action = $action;
        $this->payload = $payload;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle(): void
    {
        Log::query()->create(['user_id' => $this->user_id, 'action' => $this->action, 'payload' => $this->payload]);
    }
}
