<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id()->index();
            $table->string('name_en');
            $table->string('name_ar');
            $table->float('regular_price')->nullable();
            $table->float('sale_price');
            $table->integer('quantity')->nullable();
            $table->string('image');
            $table->integer('pieces')->nullable();
            $table->float('kg')->nullable();
            $table->enum('sale_unit', [1, 2, 3])->default(1);
            $table->unsignedBigInteger('currency_id')->index();
            $table->unsignedBigInteger('category_id')->nullable();
            $table->unsignedBigInteger('product_description_id')->nullable();
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
        Schema::dropIfExists('products');
    }
}
