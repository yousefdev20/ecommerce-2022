<?php

namespace App\Observers;

use App\Models\Product\Color;
use App\Repositories\Colors\ColorsInterface;
use App\Repositories\IStorable;

class ColorsObserver
{
    protected $colors;

    /**
     * @param ColorsInterface $colors
     */
    public function __construct(IStorable $colors)
    {
        $this->colors = $colors;
    }

    /**
     * Handle the Color "created" event.
     *
     * @param Color $color
     * @return void
     */
    public function created(Color $color)
    {
        $this->colors->refresh();
    }

    /**
     * Handle the Color "updated" event.
     *
     * @param  Color $color
     * @return void
     */
    public function updated(Color $color)
    {
        $this->colors->refresh();
    }

    /**
     * Handle the Color "deleted" event.
     *
     * @param  Color $color
     * @return void
     */
    public function deleted(Color $color)
    {
        $this->colors->refresh();
    }

    /**
     * Handle the Color "restored" event.
     *
     * @param  Color $color
     * @return void
     */
    public function restored(Color $color)
    {
    }

    /**
     * Handle the Color "force deleted" event.
     *
     * @param  Color $color
     * @return void
     */
    public function forceDeleted(Color $color)
    {
        $this->colors->refresh();
    }
}
