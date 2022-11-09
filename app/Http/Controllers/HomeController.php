<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Feature;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Menu;
use TCG\Voyager\Models\MenuItem;
use TCG\Voyager\Models\Page;
use TCG\Voyager\Models\Post;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        return view('home', [
            'active' => MenuItem::select('title')->where('url', $request->getRequestUri())->first(),
            'posts' => Post::latest()->limit(3)->get(),
            'banners' => Banner::orderBy('order', 'asc')->get(),
            'features' => Feature::get(),
            'featured' => Post::where('featured', 1)->latest()->get(),
            'menu' => menu('menu', '_json'),
            'time' => Carbon::now(),
        ]);
    }

    public function banner()
    {
        return view('banner');
    }

    public function profile(Request $request)
    {
        $id = MenuItem::select('parent_id')->where('url', $request->getRequestUri())->first();
        if ($id->parent_id === null) {
            $active = MenuItem::select('title')->where('url', $request->getRequestUri())->first();
        } else {
            $active = MenuItem::select('title')->where('id', $id->parent_id)->first();
        }
        return view('pages.index', [
            'data' => Page::where('slug', ltrim($request->getRequestUri(), '/'))->first(),
            'menu' => menu('menu', '_json'),
            'active' => $active
        ]);
    }

    public function posts(Request $request)
    {
        return view('posts.index', [
            'menu' => menu('menu', '_json'),
            'active' => MenuItem::select('title')->where('url', $request->getRequestUri())->first(),
            'posts' => Post::latest()->get(),
        ]);
    }
}
