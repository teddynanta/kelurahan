<?php

use TCG\Voyager\Voyager;
use TCG\Voyager\Models\Page;
use TCG\Voyager\Models\MenuItem;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MenuController;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Post;

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
    return view('navMenu', [
        'data' => menu('menu', '_json')
    ]);
});

Route::get('/admin/banner', [HomeController::class, 'banner']);

Route::get('/profil-kelurahan', [HomeController::class, 'profile']);

Route::get('/posts/all', function () {
    return view('posts.index', [
        'menu' => menu('menu', '_json'),
        'active' => MenuItem::select('title')->where('url', '/infografis')->first(),
        'posts' => Post::latest()->get(),
    ]);
});

foreach ($uris as $uri) {
    Route::get('/' . $uri->slug, [HomeController::class, 'profile']);
}

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
