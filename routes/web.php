<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::resource('farmers', App\Http\Controllers\FarmerController::class);

Route::resource('cities', App\Http\Controllers\CityController::class);

Route::resource('soilTypes', App\Http\Controllers\SoilTypeController::class);



Route::resource('farms', App\Http\Controllers\FarmController::class);

Route::resource('crops', App\Http\Controllers\CropController::class);

Route::resource('farmCrops', App\Http\Controllers\FarmCropController::class);



Route::resource('cooperatives', App\Http\Controllers\CooperativeController::class);

Route::resource('cooperativeMembers', App\Http\Controllers\CooperativeMemberController::class);

Route::get('/solution8', [App\Http\Controllers\SolutionsController::class, 'solution_8'])->name('solution8');
Route::get('/basequery', [App\Http\Controllers\SolutionsController::class, 'get_custom_query_page'])->name('basequery');
Route::post('/basequery', [App\Http\Controllers\SolutionsController::class, 'post_custom_query_page'])->name('postbasequery');
