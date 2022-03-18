<?php

namespace App\Observers;

use App\Models\Product\Category;
use Illuminate\Support\Facades\DB;
use App\Repositories\Category\CategoriesRepositoryInterface;

class CategoryObserver
{
    public $categoriesRepository;

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
    public function created(Category $category)
    {
        if ($category->parent_id ?? false) {
            $parent = DB::table('categories')->select(['level'])
                ->find($category->parent_id);
            $category->update(['level' => ++$parent->level]);
        }
        $this->categoriesRepository->refresh();
    }

    /**
     * Handle the Category "updated" event.
     *
     * @param Category $category
     * @return void
     */
    public function updated(Category $category)
    {
        $this->categoriesRepository->refresh();
    }

    /**
     * Handle the Category "deleted" event.
     *
     * @param Category $category
     * @return void
     */
    public function deleted(Category $category)
    {
        $this->categoriesRepository->refresh();
    }

    /**
     * Handle the Category "restored" event.
     *
     * @param Category $category
     * @return void
     */
    public function restored(Category $category)
    {
        $this->categoriesRepository->refresh();
    }

    /**
     * Handle the Category "force deleted" event.
     *
     * @param Category $category
     * @return void
     */
    public function forceDeleted(Category $category)
    {
        $this->categoriesRepository->refresh();
    }
}
