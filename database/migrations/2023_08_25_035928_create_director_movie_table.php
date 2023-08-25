<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('director_movie', function (Blueprint $table) {
            $table->unsignedBigInteger('movie_id')->index();
            $table->foreign('movie_id')->references('id')->on('movies')->onDelete('cascade');

            $table->unsignedBigInteger('director_id')->index();
            $table->foreign('director_id')->references('id')->on('directors')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('director_movie');
    }
};
