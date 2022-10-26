<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TCG\Voyager\Models\Post;

class HomeController extends Controller
{
    public function index()
    {
        return view('home', [
            'active' => 'Beranda',
            'posts' => Post::latest()->get()
        ]);
    }

    public function banner()
    {
        return view('banner');
    }
}
