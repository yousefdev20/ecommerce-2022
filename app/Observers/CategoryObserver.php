<?php

namespace App\Observers;

use App\Jobs\LogJob;
use App\Models\Product\Category;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Queue;
use App\Repositories\Category\CategoriesRepositoryInterface;

class CategoryObserver
{
    public CategoriesRepositoryInterface $categoriesRepository;

    public function __construct(CategoriesRepositoryInterface $categoriesRepository)
    {
        $this->categoriesRepository = $categoriesRepository;
    }

    /**
     * Handle the Category "created" event.
     *
     * @param Category $category
     * @return void
     */
    public function created(Category $category): void
    {
        if ($category->parent_id ?? false) {
            $parent = DB::table('categories')->select(['level'])
                ->find($category->parent_id);
            $category->update(['level' => ++$parent->level]);
        }
        $this->categoriesRepository->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'create_category', $category));
    }

    /**
     * Handle the Category "updated" event.
     *
     * @param Category $category
     * @return void
     */
    public function updated(Category $category): void
    {
        $this->categoriesRepository->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'update_category', $category->getDirty()));
    }

    /**
     * Handle the Category "deleted" event.
     *
     * @param Category $category
     * @return void
     */
    public function deleted(Category $category): void
    {
        $this->categoriesRepository->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_category', $category->id));
    }

    /**
     * Handle the Category "restored" event.
     *
     * @param Category $category
     * @return void
     */
    public function restored(Category $category): void
    {
        $this->categoriesRepository->refresh();
    }

    /**
     * Handle the Category "force deleted" event.
     *
     * @param Category $category
     * @return void
     */
    public function forceDeleted(Category $category): void
    {
        $this->categoriesRepository->refresh();
        Queue::pushOn('logs', new LogJob(auth()->id(), 'delete_category', $category));
    }
}
