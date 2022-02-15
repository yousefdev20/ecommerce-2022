<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->foreign('currency_id')
                ->references('id')
                ->on('currencies')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->foreign('category_id')
                ->references('id')
                ->on('categories')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->foreign('subcategory_id')
                ->references('id')
                ->on('categories')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->foreign('product_description_id')
                ->references('id')
                ->on('product_descriptions')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('products', function (Blueprint $table) {
            //
        });
    }
}
