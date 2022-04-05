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
    <link rel="stylesheet" href="{{ asset('css/tambah_wisata.css') }}">
</head>

<body>
    <div class="container">
        <h1 class="font-size-72 b-line b-line-mid font-w-bold">Tambah Wisata</h1>
        <form action="" class="form">
            <div class="input-container">
                <label for="nama_daerah" class="font-size-18 font-w-medium mb-2">Nama daerah</label>
                <input type="text" id="nama_daerah" name="nama_daerah" class="font-size-18">
            </div>
            <div class="input-container">
                <label for="nama_daerah" class="font-size-18 font-w-medium mb-2">Provinsi</label>
                <input type="text" id="nama_daerah" name="nama_daerah" class="font-size-18">
            </div>
            <div class="input-container">
                <label for="nama_daerah" class="font-size-18 font-w-medium mb-2">Alamat</label>
                <input type="text" id="nama_daerah" name="nama_daerah" class="font-size-18">
            </div>
            <div class="input-container">
                <label for="nama_daerah" class="font-size-18 font-w-medium mb-2">Deskripsi</label>
                <textarea type="text" id="nama_daerah" name="nama_daerah" class="font-size-18" rows="5"></textarea>
            </div>
            <div class="input-container ">
                <label for="nama_daerah" class="font-size-18 font-w-medium mb-2">Foto</label>
                <div class="input-file-wrapper">
                    <img src="" alt="image-preview" id="img-preview">
                    <p class="file-name mt-0-5 gray-text font-size-13 mb-2" style="display: none"></p>
                    <div class="input-file-container ">
                        <input type="file" id="nama_daerah" name="nama_daerah" class="font-size-18"
                            onchange="inputFileAction(this)" accept="image/*">
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
                <button class="btn primary-btn font-size-18">Tambahkan</button>
            </div>
        </form>
    </div>

    <script>
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
