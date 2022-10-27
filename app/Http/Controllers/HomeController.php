<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Feature;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Post;

class HomeController extends Controller
{
    public function index()
    {
        return view('home', [
            'active' => 'Beranda',
            'posts' => Post::latest()->get(),
            'banners' => Banner::orderBy('order', 'asc')->get(),
            'features' => Feature::get()
        ]);
    }

    public function banner()
    {
        return view('banner');
    }
}
