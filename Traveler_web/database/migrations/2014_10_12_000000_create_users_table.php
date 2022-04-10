<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id()->autoIncrement();
            $table->string('name')->nullable(false);
            $table->string('email')->unique()->nullable(false);
            $table->string('role')->nullable(false);
            $table->string('password')->nullable(false);
            $table->date('ttl')->nullable(true);
            $table->string('alamat')->nullable(true);
            $table->string('foto')->nullable(true);
            $table->string('no_hp')->nullable(true);
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
        Schema::dropIfExists('users');
    }
};