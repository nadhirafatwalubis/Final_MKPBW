<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAboutsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('abouts', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('desc');
            $table->string('image')->nullable();
            $table->string('image_header')->nullable();
            $table->string('video')->nullable();
            $table->string('address');
            $table->string('address_url')->nullable();
            $table->string('phone')->nullable();
            $table->string('wa')->nullable();
            $table->string('email');
            $table->string('fb')->nullable();
            $table->string('ig')->nullable();
            $table->string('yt')->nullable();
            $table->string('tw')->nullable();
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
        Schema::dropIfExists('abouts');
    }
}
