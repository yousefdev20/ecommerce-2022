<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeysToOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->cascadeOnUpdate();
            $table->foreign('workflow_id')
                ->references('id')
                ->on('workflows')
                ->cascadeOnUpdate();
            $table->foreign('coupon_id')
                ->references('id')
                ->on('coupon_codes')
                ->cascadeOnUpdate();
            $table->foreign('currency_id')
                ->references('id')
                ->on('currencies')
                ->cascadeOnUpdate();
            $table->foreign('shipping_address_id')
                ->references('id')
                ->on('shipping_addresses')
                ->cascadeOnUpdate();
            $table->foreign('billing_address_id')
                ->references('id')
                ->on('billing_addresses')
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
        Schema::table('orders', function (Blueprint $table) {
            //
        });
    }
}
