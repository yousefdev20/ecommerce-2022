<?php

namespace App\Observers;

use App\Models\Product\Size;
use App\Repositories\Sizes\SizesInterface;

class SizesObserver
{
    protected SizesInterface $sizes;

    public function __construct(SizesInterface $sizes)
    {
        $this->sizes = $sizes;
    }

    /**
     * Handle the Size "created" event.
     *
     * @param Size $size
     * @return void
     */
    public function created(Size $size)
    {
        $this->sizes->refresh();
    }

    /**
     * Handle the Size "updated" event.
     *
     * @param Size $size
     * @return void
     */
    public function updated(Size $size)
    {
        $this->sizes->refresh();
    }

    /**
     * Handle the Size "deleted" event.
     *
     * @param Size $size
     * @return void
     */
    public function deleted(Size $size)
    {
        $this->sizes->refresh();
    }

    /**
     * Handle the Size "restored" event.
     *
     * @param Size $size
     * @return void
     */
    public function restored(Size $size)
    {
        $this->sizes->refresh();
    }

    /**
     * Handle the Size "force deleted" event.
     *
     * @param Size $size
     * @return void
     */
    public function forceDeleted(Size $size)
    {
        $this->sizes->refresh();
    }
}
