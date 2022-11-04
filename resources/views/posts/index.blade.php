@extends('layouts.main')
@section('component')
    <div class="row mt-5">
        @foreach ($posts as $post)
            <div class="col-sm-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        @if (!$post->image)
                            <img class="img-fluid mb-2" src="https://via.placeholder.com/300x150.png?text=Tidak+Ada+Gambar"
                                alt="Tidak Ada Gambar">
                        @else
                            <img class="img-fluid mb-2" src="/storage/{{ $post->image }}">
                        @endif
                        <h5 class="card-title">{{ $post->title }}</h5>
                        <class="card-text">{{ $post->excerpt }}<a href="/posts/show/{{ $post->id }}">baca
                                selengkapnya</a></p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        @endforeach
    @endsection
