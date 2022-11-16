@extends('layouts.main')
@section('component')
    <div class="row text-center mt-5">
        @if ($data)
            <h3>{{ $data->title }}</h3>
            @if ($data->image)
                <img class="mx-auto" src="/storage/{{ $data->image }}" alt="{{ $data->title }}" style="max-width: 50vmax">
            @endif
            <div class="col-md-12">
                <p>{!! $data->body !!}</p>
            </div>
        @else
            <h1 class="my-3">Belum ada konten yang bisa ditampilkan</h1>
        @endif
    </div>
@endsection
