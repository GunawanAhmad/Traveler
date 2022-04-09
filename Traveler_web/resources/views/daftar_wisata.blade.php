@extends('sidebar')
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/daftar_wisata.css') }}">
</head>

<body>
    <div class="container">
        <h1 class="font-size-72 b-line b-line-mid font-w-bold">Daftar Wisata</h1>
        <ul>

            @foreach ($data as $item)
                <li class="wisata-container" id="{{ $item->id }}">
                    <a href="">
                        <img src="{{ url('/') . '/storage/images/' . $item->foto }}" alt="">
                        <div class="tempat-info">
                            <p class="font-size-24 font-w-bold mb-1">{{ $item->nama_daerah }}</p>
                            <p class="gray-text"><span>
                                    <i class="fa-solid fa-location-dot"></i></span> {{ $item->alamat }}</p>
                        </div>
                    </a>
                    <div class="action-btn">
                        <a href="/edit_wisata/{{ $item->id }}" class="btn">
                            <i class="fa-solid fa-pencil"></i>
                        </a>
                        <button data-toggle="modal" data-target="#deleteConfimation"
                            onclick="selectDeleteItem({{ $item->id }})">
                            <i class="fa-solid fa-trash-can"></i>
                        </button>
                    </div>
                    <input type="hidden">
                </li>
            @endforeach
        </ul>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="deleteConfimation" tabindex="-1" role="dialog"
        aria-labelledby="deleteConfimationLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title font-weight-bold" id="deleteConfirmationLabel">Hapus wisata</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Hapus wisata secara permanen?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">Tutup</button>
                    <button type="button" class="btn btn-danger" onclick="deleteWisata()">Hapus</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <script>
        let selectedIDWisata = 0;

        function selectDeleteItem(id) {
            selectedIDWisata = id;
        }

        function deleteWisata() {
            fetch('/hapus_wisata', {
                    method: 'delete',
                    credentials: "same-origin",
                    body: JSON.stringify({
                        id: selectedIDWisata
                    }),
                    headers: {
                        "Content-Type": "application/json",
                        "Accept": "application/json",
                        "X-Requested-With": "XMLHttpRequest",
                        "X-CSRF-Token": $('input[name="_token"]').val()
                    },
                }).then(function(response) {
                    return response.json();
                }).then(function(json) {
                    console.log(json);
                    $('#deleteConfimation').modal('hide');
                    deleteElm()
                })
                .catch(function(error) {
                    console.log(error);
                })
        }

        function deleteElm() {
            $('.wisata-container#' + selectedIDWisata).remove();
        }
    </script>
</body>

</html>
