<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use Illuminate\Http\Request;
use TCG\Voyager\Models\Post;

class HomeController extends Controller
{
    public function index()
    {
        return view('home', [
            'active' => 'Beranda',
            'posts' => Post::latest()->get(),
            'banners' => Banner::orderBy('order', 'asc')->get()
        ]);
    }

    public function banner()
    {
        return view('banner');
    }
}
