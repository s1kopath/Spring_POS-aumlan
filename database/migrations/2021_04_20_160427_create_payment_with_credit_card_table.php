<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentWithCreditCardTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payment_with_credit_card', function (Blueprint $table) {
            $table->id();
            $table->integer('payment_id');
            $table->integer('customer_id');
            $table->string('customer_stripe_id');

            $table->string('card_number');
            $table->string('charge_id');
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
        Schema::dropIfExists('payment_with_credit_card');
    }
}