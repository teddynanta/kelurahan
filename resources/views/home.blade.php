@extends('layouts.main')

@section('component')
    

<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <marquee class="mt-2" behavior="#" direction="">{{ setting('site.description') }}</marquee>
    <div class="carousel-indicators">
    @foreach ($banners as $banner)
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="{{ $loop->index }}" class="{{ $loop->first ? 'active' : '' }}" aria-current="true" aria-label="Slide {{ $loop->iteration }}"></button>
    @endforeach
    </div>
    <div class="carousel-inner">
    @foreach ($banners as $banner)    
        <div class="carousel-item {{ $loop->first ? 'active' : '' }}" aria-hidden="true">
            <img class="d-block mx-auto" width="100%" height="100%" src="/storage/{{ $banner->image }}" alt="">
        </div>
    @endforeach
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
    </button>
</div>


<!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    
    <div class="marketing">
        
    <div class="row mb-5">
        @foreach ($features as $feature)
            <div class="col-md-2">
                <a class="text-decoration-none text" href="{{ $feature->link }}" target="__blank">
                    <div class="card">
                        <div class="card-body">
                            <img src="/storage/{{ $feature->icon }}" class="d-block mb-3 mx-auto" height="100px" style="aspect-ratio:1;">
                            <h5 class="card-title text-center text-secondary mb-0"> {{ $feature->name }}</h5>
                        </div>
                    </div>
                </a>
            </div>
        @endforeach
    </div>

    <div class="row mb-3 text-center">
        <div class="col-md-7 themed-grid-col">
            <div id="img-gallery" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="mask" src="/storage/{{ $posts[0]->image }}" alt="{{ $posts[0]->title }}" width="100%" height="100%" preserveAspectRatio="xMidYMid slice">
                    {{-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg> --}}
            
                    <div class="container">
                    <div class="carousel-caption text-start">
                        <h1>{{ $posts[0]->title }}</h1>
                        <p>Some representative placeholder content for the first slide of the carousel.</p>
                    </div>
                    </div>
                </div>
                </div>
            </div>            
        </div>
        <div class="col-md-5 themed-grid-col">
            <div class="row">
                @foreach ($posts as $post)
                
                <div class="col-md-12 mb-3">
                    <div class="card">
                        <div class="card-body d-flex flex-row">
                            <img class="img-thumbnail" src="/storage/{{ $post->image }}" width="20%">
                            <h5 class="card-title">&nbsp;&nbsp;{{ $post->title }}</h5>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette mb-5">
        <div class="card card-cover h-100 overflow-hidden rounded-4 shadow-lg" style="background-color: #777;">
            <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Berita Terbaru</h2>
            <ul class="d-flex list-unstyled mt-auto">
                <li class="me-auto">
                    <img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white"> Admin Kelurahan X
                </li>
                <li class="d-flex align-items-center me-3">
                    <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"/></svg>
                    <small>Earth</small>
                </li>
                <li class="d-flex align-items-center">
                    <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"/></svg>
                    <small>3d</small>
                </li>
            </ul>
            </div>
        </div>
    </div>
    <div class="row featurette">
    <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
    </div>
    <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

    </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
    <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading fw-normal lh-1">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
    </div>
    <div class="col-md-5 order-md-1">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

    </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
    <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
    </div>
    <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

    </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

</div><!-- /.container -->

@endsection