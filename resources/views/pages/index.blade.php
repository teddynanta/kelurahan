@extends('layouts.main')
@section('component')
    <div class="row g-5 mt-2">
        <div class="col-md-8">
            @if ($data)
                @if (Request::is('sarana*'))
                    <div style="height: 35vmax">
                        <h5>{{ $data->title }} di {{ setting('site.title') }} Tahun {{ $charts->tahun }}
                        </h5>
                        <p></p>
                        <canvas id="chartData" class="mb-5"></canvas>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    @php
                        $charts = json_encode($charts);
                        $schema = json_encode($schema);
                    @endphp
                    <script>
                        const chartData = document.getElementById('chartData');
                        new Chart(chartData, {
                            type: 'bar',
                            data: {
                                labels: {{ $schema }},
                                datasets: [{
                                    label: 'Jumlah',
                                    data: {{ $charts }},
                                    backgroundColor: [
                                        'rgb(54, 162, 235)',
                                    ],
                                    hoverOffset: 4,
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                            }
                        });
                    </script>
                @else
                    <h3 class="text-center mb-3 fw-bold">{{ $data->title }}</h3>
                    <hr>
                    @if ($data->image)
                        <img class="mx-auto mb-3" src="/storage/{{ $data->image }}" alt="{{ $data->title }}"
                            style="max-width: 50vmax">
                    @endif
                    {!! $data->body !!}
                @endif
            @else
                <h2 class="text-center my-3">Belum ada konten yang bisa ditampilkan</h2>
            @endif

        </div>
        <div class="col-md-4">
            @include('sidemenu')
        </div>
    </div>
@endsection
