@extends('layouts.main')
@section('component')
    <div class="row g-5 mt-2">
        <div class="col-md-8">
            <h3 class="text-center mb-3 fw-bold">{{ $active->title }}</h3>
            <hr>
            <div style="height: 35vmax">
                <h5>Data Penduduk {{ setting('site.title') }} Berdasarkan Jenis Kelamin Tahun {{ $populations->tahun }}</h5>
                <canvas id="dataPenduduk" class="mb-5"></canvas>
            </div>

            <div style="height: 35vmax">
                <h5>Kewarganegaraan Penduduk {{ setting('site.title') }} Tahun {{ $populations->tahun }}</h5>
                <canvas id="kewarganegaraan" class="mb-5"></canvas>
            </div>

            <div style="height: 35vmax">
                <h5>Keberagaman Agama di {{ setting('site.title') }} Tahun {{ $religions->tahun }}</h5>
                <canvas id="keagamaan" class="mb-5"></canvas>
            </div>

            <div style="height: 35vmax">
                <h5>Mata Pencaharian Penduduk {{ setting('site.title') }} Tahun {{ $jobs->tahun }}</h5>
                <canvas id="pekerjaan" class="mb-5"></canvas>
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
                            data: [{{ json_encode($populations['laki_laki']) }},
                                {{ json_encode($populations['perempuan']) }}
                            ],
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
                            data: [{{ json_encode($populations['wni']) }},
                                {{ json_encode($populations['wna']) }}
                            ],
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
            <script>
                const keagamaan = document.getElementById('keagamaan');

                new Chart(keagamaan, {
                    type: 'bar',
                    data: {
                        labels: [
                            'Islam',
                            'Protestan',
                            'Katolik',
                            'Hindu',
                            'Buddha',
                            'Khonghucu',
                        ],
                        datasets: [{
                            label: 'Jumlah',
                            data: [
                                {{ json_encode($religions['islam']) }},
                                {{ json_encode($religions['protestan']) }},
                                {{ json_encode($religions['katolik']) }},
                                {{ json_encode($religions['hindu']) }},
                                {{ json_encode($religions['buddha']) }},
                                {{ json_encode($religions['khonghucu']) }},
                            ],
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
            <script>
                const pekerjaan = document.getElementById('pekerjaan');

                new Chart(pekerjaan, {
                    type: 'bar',
                    data: {
                        labels: [
                            'PNS',
                            'TNI/POLRI',
                            'Wiraswasta',
                            'Pedagang',
                            'Pegawai Swasta',
                            'Tenaga Kesehatan',
                            'Buruh',
                        ],
                        datasets: [{
                            label: 'Jumlah',
                            data: [
                                {{ json_encode($jobs['pns']) }},
                                {{ json_encode($jobs['tni_polri']) }},
                                {{ json_encode($jobs['wiraswasta']) }},
                                {{ json_encode($jobs['pedagang']) }},
                                {{ json_encode($jobs['pegawai_swasta']) }},
                                {{ json_encode($jobs['medis']) }},
                                {{ json_encode($jobs['buruh']) }},
                            ],
                            backgroundColor: [
                                'rgb(54, 162, 235)',
                            ],
                            hoverOffset: 4,
                        }]
                    },
                    options: {
                        indexAxis: 'y',
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            x: {
                                ticks: {
                                    stepSize: 10,
                                },
                            },
                        },
                    },
                });
            </script>

        </div>
        <div class="col-md-4">
            @include('sidemenu')
        </div>
    </div>
@endsection
