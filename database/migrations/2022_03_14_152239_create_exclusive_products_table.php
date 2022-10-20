<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExclusiveProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exclusive_products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')
                ->references('id')->on('products')
            ->cascadeOnDelete()
            ->cascadeOnUpdate();
            $table->timestamp('expiration_date');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('exclusive_products');
    }
}
