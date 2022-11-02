{{-- @dd($active) --}}
<nav class="navbar navbar-expand-md navbar-dark bg-primary fixed-top">
    <div class="container">
        <a href="/"><img class="navbar-brand" src="storage/{{ setting('site.logo') }}" alt="logo"
                height="60px"></a>
        <a class="navbar-brand d-block text-wrap lh-1" href="/" style="width: 20%">
            {{ setting('site.title') }}</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav nav-pills me-auto mb-2 mb-md-0">
                @foreach ($menu as $item)
                    @if ($item->children->isEmpty())
                        <li class="nav-item">
                            <a class="nav-link {{ $active === $item->title ? 'active' : '' }}" aria-current="page"
                                href="{{ $item->url }}">{{ $item->title }}</a>
                        </li>
                    @else
                        <li class="nav-item dropdown">
                            <a class="nav-link {{ $active->title === $item->children->title ? 'active' : '' }} dropdown-toggle"
                                href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                {{ $item->title }}
                            </a>
                            <ul class="dropdown-menu">
                                @foreach ($item->children as $child)
                                    <li>
                                        <a class="dropdown-item" href="{{ $child->url }}">{{ $child->title }}</a>
                                    </li>
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
