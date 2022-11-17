<div class="position-sticky" style="top: 4rem;">
    <div class="p-4 mb-3 bg-light rounded">
        <h4 class="fst-italic text-center">Sambutan Lurah</h4>
        <img class="mb-2 d-block mx-auto" src="/storage/{{ setting('admin.foto_lurah') }}" alt="Foto Lurah"
            style="max-height: 10vmax; width: auto">
        <p class="fw-bold mb-0 text-center">{{ setting('admin.nama_lurah') }}</p>
        <p class="fst-italic text-center"> Lurah {{ setting('site.title') }}</p>
        <p class="mb-0">{{ setting('site.description') }}</p>
    </div>

    <a class="weatherwidget-io" href="https://forecast7.com/en/n3d30102d86/lubuklinggau/"
        data-label_1="{{ setting('site.title') }}" data-icons="Climacons"
        data-theme="pure">{{ setting('site.title') }}</a>
    <script>
        ! function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (!d.getElementById(id)) {
                js = d.createElement(s);
                js.id = id;
                js.src = 'https://weatherwidget.io/js/widget.min.js';
                fjs.parentNode.insertBefore(js, fjs);
            }
        }(document, 'script', 'weatherwidget-io-js');
    </script>

    <div class="p-4">
        <h4 class="fst-italic">Archives</h4>
        <ol class="list-unstyled mb-0">
            <li><a href="#">March 2021</a></li>
            <li><a href="#">February 2021</a></li>
            <li><a href="#">January 2021</a></li>
            <li><a href="#">December 2020</a></li>
            <li><a href="#">November 2020</a></li>
            <li><a href="#">October 2020</a></li>
            <li><a href="#">September 2020</a></li>
            <li><a href="#">August 2020</a></li>
            <li><a href="#">July 2020</a></li>
            <li><a href="#">June 2020</a></li>
            <li><a href="#">May 2020</a></li>
            <li><a href="#">April 2020</a></li>
        </ol>
    </div>

    <div class="p-4">
        <h4 class="fst-italic">Sosmed</h4>
        <ol class="list-unstyled">
            <li><a href="{{ setting('site.instagram') }}">Instagram</a></li>
            <li><a href="{{ setting('site.twitter') }}">Twitter</a></li>
            <li><a href="{{ setting('site.youtube') }}">YouTube</a></li>
        </ol>
    </div>
</div>
