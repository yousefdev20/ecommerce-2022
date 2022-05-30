<?php

namespace App\Observers;

use App\Jobs\LogJob;
use App\Models\Product\Color;
use App\Repositories\IStorable;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Queue;
use App\Repositories\Colors\ColorsInterface;

class ColorsObserver
{
    protected IStorable $colors;

    /**
     * @param ColorsInterface $colors
     */
    public function __construct(ColorsInterface $colors)
    {
        $this->colors = $colors;
    }

    /**
     * Handle the Color "created" event.
     *
     * @param Color $color
     * @return void
     */
    public function created(Color $color): void
    {
        $this->colors->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'create_color', $color));
    }

    /**
     * Handle the Color "updated" event.
     *
     * @param Color $color
     * @return void
     */
    public function updated(Color $color): void
    {
        $this->colors->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'update_color', $color->getDirty()));
    }

    /**
     * Handle the Color "deleted" event.
     *
     * @param Color $color
     * @return void
     */
    public function deleted(Color $color): void
    {
        $this->colors->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_color', $color->id));
    }

    /**
     * Handle the Color "force deleted" event.
     *
     * @param Color $color
     * @return void
     */
    public function forceDeleted(Color $color): void
    {
        $this->colors->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_color', $color->id));
    }
}
