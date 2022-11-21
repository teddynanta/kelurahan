@extends('layouts.main')
@section('component')
    <div class="row g-5 mt-2">
        <div class="col-md-8">
            <h3 class="text-center mb-3 fw-bold">{{ $active->title }}</h3>
            <hr>
            <div style="height: 35vmax">
                <h5>Data Penduduk {{ setting('site.title') }} Berdasarkan Jenis Kelamin Tahun {{ $data->tahun }}</h5>
                <canvas id="dataPenduduk" class="mb-5"></canvas>
            </div>

            <div style="height: 35vmax">
                <h5>Kewarganegaraan Penduduk {{ setting('site.title') }} Tahun {{ $data->tahun }}</h5>
                <canvas id="kewarganegaraan" class="mb-5"></canvas>
            </div>

            <div style="height: 35vmax">
                <h5>Kewarganegaraan Penduduk {{ setting('site.title') }} Tahun {{ $data->tahun }}</h5>
                <canvas id="kewarganegaraan" class="mb-5"></canvas>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                const dataPenduduk = document.getElementById('dataPenduduk');

                new Chart(dataPenduduk, {
                    type: 'pie',
                    data: {
                        labels: ['Laki-laki', 'Perempuan'],
                        datasets: [{
                            label: 'Jumlah',
                            data: [{{ json_encode($data['laki_laki']) }}, {{ json_encode($data['perempuan']) }}],
                            backgroundColor: [
                                'rgb(54, 162, 235)',
                                'rgb(255, 99, 132)'
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
            <script>
                const kewarganegaraan = document.getElementById('kewarganegaraan');

                new Chart(kewarganegaraan, {
                    type: 'pie',
                    data: {
                        labels: ['WNI', 'WNA'],
                        datasets: [{
                            label: 'Jumlah',
                            data: [{{ json_encode($data['wni']) }}, {{ json_encode($data['wna']) }}],
                            backgroundColor: [
                                'rgb(184, 215, 157)',
                                'rgb(188, 157, 215)'
                            ],
                            hoverOffset: 4
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                    }
                });
            </script>

        </div>
        <div class="col-md-4">
            @include('sidemenu')
        </div>
    </div>
@endsection
