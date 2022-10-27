<ul class="navbar-nav me-auto mb-2 mb-md-0">
  @foreach ($menus as $menu)
    @if ($menu->url == "" && $menu->parent_id === null)
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        {{ $menu->title }}
      </a>
      <ul class="dropdown-menu">
        @foreach ($dropdowns as $dropdown)  
          <li><a class="dropdown-item" href="{{ $dropdown->url }}">{{ $dropdown->title }}</a></li>
        @endforeach
      </ul>
    </li>
    @if ($menu->url !== null && $menu->)
    <li class="nav-item">
      <a class="nav-link active" aria-current="page" href="{{ $menu->url }}">{{ $menu->title }}</a>
    </li>
    @endif
  @endforeach
</ul>
{{-- @if ($menu->url == "" && $menu->parent_id === null)
<li class="nav-item dropdown">
  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
    {{ $menu->title }}
  </a>
  <ul class="dropdown-menu">
    @foreach ($dropdowns as $dropdown)  
      <li><a class="dropdown-item" href="{{ $dropdown->url }}">{{ $dropdown->title }}</a></li>
    @endforeach
  </ul>
</li>
@else
<li class="nav-item">
  <a class="nav-link active" aria-current="page" href="{{ $menu->url }}">{{ $menu->title }}</a>
</li>
@endif --}}