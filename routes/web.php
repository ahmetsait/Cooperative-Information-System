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

Route::get('/solution10', [App\Http\Controllers\SolutionsController::class, 'solution_10_get'])->name('solution10get');
Route::post('/solution10', [App\Http\Controllers\SolutionsController::class, 'solution_10_post'])->name('solution10post');

Route::get('/solution11', [App\Http\Controllers\SolutionsController::class, 'solution_11_get'])->name('solution11get');
Route::post('/solution11', [App\Http\Controllers\SolutionsController::class, 'solution_11_post'])->name('solution11post');

Route::get('/solution12', [App\Http\Controllers\SolutionsController::class, 'solution_smaller_than_average'])->name('solution12');

Route::get('/solution13', [App\Http\Controllers\SolutionsController::class, 'solution_13_get'])->name('solution13get');
Route::post('/solution13', [App\Http\Controllers\SolutionsController::class, 'solution_13_post'])->name('solution13post');

Route::get('/solution14', [App\Http\Controllers\SolutionsController::class, 'solution_14'])->name('solution14');
