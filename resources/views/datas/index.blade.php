@extends('layouts.main')
@section('component')
    <div class="row g-5 mt-2">
        <div class="col-md-8">
            <h2 class="text-center">{{ $active->title }}</h2>
            @if ($data)
                <div>
                    <canvas id="myChart"></canvas>
                </div>
                <script>
                    const ctx = document.getElementById('myChart');

                    new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: ['Laki-laki', 'Perempuan'],
                            datasets: [{
                                label: 'My First Dataset',
                                data: [foreac],
                                backgroundColor: [
                                    'rgb(255, 99, 132)',
                                    'rgb(54, 162, 235)'
                                ],
                                hoverOffset: 4
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                </script>
            @else
                <h2 class="text-center my-3">Belum ada konten yang bisa ditampilkan</h2>
            @endif

        </div>
        <div class="col-md-4">
            @include('sidemenu')
        </div>
    </div>
@endsection
