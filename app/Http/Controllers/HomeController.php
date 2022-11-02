<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Feature;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Menu;
use TCG\Voyager\Models\MenuItem;
use TCG\Voyager\Models\Page;
use TCG\Voyager\Models\Post;

class HomeController extends Controller
{
    public function index()
    {
        return view('home', [
            'active' => 'Beranda',
            'posts' => Post::latest()->limit(3)->get(),
            'banners' => Banner::orderBy('order', 'asc')->get(),
            'features' => Feature::get(),
            'featured' => Post::where('featured', 1)->latest()->get(),
            'menu' => menu('menu', '_json')
        ]);
    }

    public function banner()
    {
        return view('banner');
    }

    public function profile(Request $request)
    {
        return view('pages.index', [
            'data' => Page::where('slug', ltrim($request->getRequestUri(), '/'))->first(),
            'menu' => menu('menu', '_json'),
            'active' => MenuItem::select('title')->where('url', $request->getRequestUri())->first()
        ]);
    }
}
