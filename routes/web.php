<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\MenuController;
use Illuminate\Support\Facades\Route;
use TCG\Voyager\Models\Page;

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

$uris = Page::select('slug')->get();

Route::get('/', [HomeController::class, 'index']);

Route::get('/dump', function () {
    return view('navMenu');
});

Route::get('/admin/banner', [HomeController::class, 'banner']);

Route::get('/profil-kelurahan', [HomeController::class, 'profile']);

foreach ($uris as $uri) {
    Route::get('/' . $uri->slug, [HomeController::class, 'profile']);
}

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
