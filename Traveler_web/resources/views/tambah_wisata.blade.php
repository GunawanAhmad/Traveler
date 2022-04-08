@extends('sidebar')
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/tambah_wisata.css') }}">
</head>

<body>
    <!-- Modal -->
    @if ($errors->any())
        <div class="modal fade hide" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Error</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p class="text-center">
                            {{ $errors->first() }}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    @endif
    <div class="container">
        <h1 class="font-size-72 b-line b-line-mid font-w-bold">Tambah Wisata</h1>
        <form action="/tambah_wisata" method="POST" class="form" enctype="multipart/form-data">
            @csrf
            <div class="input-container">
                <label for="nama_daerah" class="font-size-18 font-w-medium mb-2">Nama daerah</label>
                <input type="text" id="nama_daerah" name="nama_daerah" class="font-size-18">
            </div>
            <div class="input-container">
                <label for="nama_daerah" class="font-size-18 font-w-medium mb-2">Provinsi</label>
                <select name="provinsi" class="font-size-18 font-w-medium">
                    <option value="Aceh">Aceh</option>
                    <option value="Sumut">Sumatera Utara</option>
                    <option value="sumbar">Sumatera Barat</option>
                    <option value="Riau">Riau</option>
                    <option value="Jambi">Jambi</option>
                    <option value="Sumsel">Sumatera Selatan</option>
                    <option value="Bengkulu">Bengkulu</option>
                    <option value="Lampung">Lampung</option>
                    <option value="BaBel">Kep. Bangka Belitung</option>
                    <option value="kepRiau">Kepulauan Riau</option>
                    <option value="Jakarta">Jakarta</option>
                    <option value="Jabar">Jawa Barat</option>
                    <option value="Banten">Banten</option>
                    <option value="Jateng">Jawa Tengah</option>
                    <option value="Yogyakarta">Yogyakarta</option>
                    <option value="Jatim">Jawa Timur</option>
                    <option value="Kalbar">Kalimantan Barat</option>
                    <option value="Kalteng">Kalimantan Tengah</option>
                    <option value="Kalsel">Kalimantan Selatan</option>
                    <option value="Kaltim">Kalimantan Timur</option>
                    <option value="Kaltra">Kalimantan Utara</option>
                    <option value="Bali">Bali</option>
                    <option value="NTT">Nusa Tenggara Timur</option>
                    <option value="NTB">Nusa Tenggara Barat</option>
                    <option value="Sulut">Sulawesi Utara</option>
                    <option value="Sulteng">Sulawesi Tengah</option>
                    <option value="Sulsel">Sulawesi Selatan</option>
                    <option value="Sultengg">Sulawesi Tenggara</option>
                    <option value="Sulbar">Sulawesi Barat</option>
                    <option value="Gorontalo">Gorontalo</option>
                    <option value="Maluku">Maluku</option>
                    <option value="Maluku Utara">Maluku Utara</option>
                    <option value="Papua">Papua</option>
                    <option value="Papua Barat">Papua Barat</option>
                </select>
            </div>
            <div class="input-container">
                <label for="alamat" class="font-size-18 font-w-medium mb-2">Alamat</label>
                <input type="text" id="alamat" name="alamat" class="font-size-18">
            </div>
            <div class="input-container">
                <label for="deskripsi" class="font-size-18 font-w-medium mb-2">Deskripsi</label>
                <textarea type="text" id="deskripsi" name="deskripsi" class="font-size-18" rows="5"></textarea>
            </div>
            <div class="input-container ">
                <label for="foto" class="font-size-18 font-w-medium mb-2">Foto</label>
                <div class="input-file-wrapper">
                    <img src="" alt="image-preview" id="img-preview">
                    <p class="file-name mt-0-5 gray-text font-size-13 mb-2" style="display: none"></p>
                    <div class="input-file-container ">
                        <input type="file" id="foto" name="foto" class="font-size-18" onchange="inputFileAction(this)"
                            accept="image/*">
                        <div class="text-center">
                            <div class="icon font-size-24">
                                <i class="fa-solid fa-file-image "></i>
                            </div>
                            <p class="">Drop gambar ke sini, atau <span
                                    class="secondary-text">pilih</span>
                            </p>
                        </div>
                    </div>

                </div>
            </div>
            <div class="text-end">
                <button type="submit" class="btn primary-btn font-size-18">Tambahkan</button>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <script type="text/javascript">
        @if (count($errors) > 0)
            $('#exampleModal').modal('show');
        @endif

        function inputFileAction(e) {
            const [file] = e.files
            if (file) {
                document.querySelector("#img-preview").setAttribute("src", URL.createObjectURL(file));
                document.querySelector('.file-name').innerText = e.files[0].name
                document.querySelector('.file-name').style.display = 'block'
            }
        }
    </script>
</body>

</html>
