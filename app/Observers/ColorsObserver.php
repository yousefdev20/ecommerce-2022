<?php

namespace App\Observers;

use App\Repositories\Colors\ColorsInterface;
use App\Repositories\IStorable;

class ColorsObserver
{
    protected IStorable $colors;

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
     * @return void
     */
    public function created()
    {
        $this->colors->refresh();
    }

    /**
     * Handle the Color "updated" event.
     *
     * @return void
     */
    public function updated()
    {
        $this->colors->refresh();
    }

    /**
     * Handle the Color "deleted" event.
     *
     * @return void
     */
    public function deleted()
    {
        $this->colors->refresh();
    }

    /**
     * Handle the Color "force deleted" event.
     *
     * @return void
     */
    public function forceDeleted()
    {
        $this->colors->refresh();
    }
}
