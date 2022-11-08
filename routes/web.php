<?php

use TCG\Voyager\Voyager;
use TCG\Voyager\Models\Page;
use TCG\Voyager\Models\MenuItem;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MenuController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
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

// $uris = Page::select('slug')->get();
$uris = MenuItem::select('url')->where('menu_id', 2)->where('url', '!=', '/')->where('url', '!=', '')->where('url', '!=', '/posts')->get();



Route::get('/', [HomeController::class, 'index']);

Route::get('/dump', function () {

    $uris = MenuItem::select('url')->where('menu_id', 2)->where('url', '!=', '/')->where('url', '!=', '')->where('url', '!=', '/posts')->get();
    dd($uris);
    return view('navMenu', [
        'data' => menu('menu', '_json')
    ]);
});

Route::get('/admin/banner', [HomeController::class, 'banner']);

Route::get('/posts', [HomeController::class, 'posts']);

foreach ($uris as $uri) {
    Route::get($uri->url, [HomeController::class, 'profile']);
}


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
