{{-- @dd($active) --}}
<nav class="navbar navbar-expand-md navbar-dark bg-primary fixed-top" id="navbar">
    <div class="container">
        <a href="/"><img id="logo" class="navbar-brand mt-1" src="/storage/{{ setting('site.logo') }}"
                alt="logo" height="60px"></a>
        <a class="navbar-brand d-block text-wrap lh-sm fw-normal text-uppercase" href="/" style="width: 20%">
            {{ setting('site.title') }}</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse ms-auto" id="navbarCollapse">
            <ul class="navbar-nav nav-pills ms-auto mb-2 mb-md-0 text-uppercase">
                @foreach ($menu as $item)
                    @if ($item->children->isEmpty())
                        <li class="nav-item">
                            <a class="nav-link {{ $active->title === $item->title ? 'active fw-bold' : '' }}"
                                aria-current="page" href="{{ $item->url }}">{{ $item->title }}</a>
                        </li>
                    @else
                        <li class="nav-item dropdown">
                            <a class="nav-link {{ $active->title === $item->title ? 'active fw-bold' : '' }} dropdown-toggle"
                                href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                {{ $item->title }}
                            </a>
                            <ul class="dropdown-menu w-25">
                                @foreach ($item->children as $child)
                                    <li>
                                        <a class="dropdown-item text-wrap"
                                            href="{{ $child->url }}">{{ $child->title }}</a>
                                    </li>
                                    <hr class="w-75 mx-auto">
                                @endforeach
                            </ul>
                        </li>
                    @endif
                @endforeach
            </ul>
            <form class="d-flex" role="search">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fas fa-search text-white"></i>
                </button>
            </form>
        </div>
    </div>
</nav>
