@extends('layouts.main')
@section('component')
    <div class="row g-5 mt-2">
        <div class="col-md-8">
            <article class="blog-post">
                <h1 class="mt-5 blog-post-title">{{ $post->title }}</h1>
                <p class="blog-post-meta">{{ $post->created_at->format('j F, Y') }} by {{ $post->authorId['name'] }}</p>
                {!! $post->body !!}
            </article>
        </div>
        <div class="col-md-4">
            @include('sidemenu')
        </div>
    </div>
@endsection
