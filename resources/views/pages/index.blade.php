@extends('layouts.main')
@section('component')
  <div class="row text-center mt-4">
    <h3>{{ $data->title }}</h3>
    <div class="col-md-12 text-start">
      <p>{!! $data->body !!}</p>
    </div>
  </div>
@endsection