<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Feature;
use App\Models\Infographic;
use App\Models\Job;
use App\Models\Population;
use App\Models\Religion;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Category;
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
            'posts' => Post::latest()->where('featured', 0)->paginate(5),
            'banners' => Banner::orderBy('order', 'asc')->get(),
            'features' => Feature::get(),
            'featured' => Post::where('featured', 1)->latest()->limit(2)->get(),
            'menu' => menu('menu', '_json'),
            'time' => Carbon::now(),
            'categories' => Category::all(),
        ]);
    }

    public function datas(Request $request)
    {

        return view('datas.index', [
            'menu' => menu('menu', '_json'),
            'active' => MenuItem::select('title')->where('url', $request->getRequestUri())->first(),
            'populations' => Population::where('tahun', Carbon::now()->year)->first(),
            'religions' => Religion::where('tahun', Carbon::now()->year)->first(),
            'jobs' => Job::where('tahun', Carbon::now()->year)->first(),
            'categories' => Category::all(),
        ]);
    }

    public function infografis(Request $request)
    {
        return view('infographics.index', [
            'menu' => menu('menu', '_json'),
            'active' => MenuItem::select('title')->where('url', $request->getRequestUri())->first(),
            'posts' => Infographic::latest()->get(),
            'categories' => Category::all(),
        ]);
    }

    public function showinfografis(Infographic $id)
    {
        return view('infographics.show', [
            'menu' => menu('menu', '_json'),
            'active' => MenuItem::select('title')->where('url', '/infografis')->first(),
            'post' => $id,
            'categories' => Category::all(),
        ]);
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
            'active' => $active,
            'categories' => Category::all(),
        ]);
    }

    public function posts()
    {
        if (!request('category')) {
            $post = Post::latest()->get();
        } else {
            $post = Post::where('category_id', request('category'))->latest()->get();
        }
        return view('posts.index', [
            'menu' => menu('menu', '_json'),
            'active' => MenuItem::select('title')->where('url', '/posts')->first(),
            'posts' => $post,
            'categories' => Category::all(),
        ]);
    }

    public function showPost(Post $id)
    {
        return view('posts.show', [
            'menu' => menu('menu', '_json'),
            'active' => MenuItem::select('title')->where('url', '/posts')->first(),
            'post' => $id,
            'categories' => Category::all(),
        ]);
    }
}
