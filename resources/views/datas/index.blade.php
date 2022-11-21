@extends('layouts.main')
@section('component')
    <div class="row g-5 mt-2">
        <div class="col-md-8">
            <h2 class="text-center">{{ $active->title }}</h2>
            <div>
                <canvas id="myChart"></canvas>
            </div>
            <input type="radio" name="" id="">
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                const ctx = document.getElementById('myChart');

                new Chart(ctx, {
                    var labels = {{ Js::from($labels) }}
                    type: 'pie',
                    data: {
                        labels: ['Laki-laki', 'Perempuan'],
                        datasets: [{
                            label: 'Jumlah',
                            data: [677, 672],
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

        </div>
        <div class="col-md-4">
            @include('sidemenu')
        </div>
    </div>
@endsection
