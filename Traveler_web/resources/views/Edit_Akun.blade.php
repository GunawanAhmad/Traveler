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
    <link rel="stylesheet" href="{{ asset('css/Edit_Akun.css') }}">
</head>

<body>

    <div class="container">

        <h5 class="font-size-72  font-w-bold b-line b-line-mid ">Edit Akun</h5>
        <br>
        <br>
        <div class="user-info flex flex center">
            <div class="img-container">
                <img src="{{ url('/') . '/storage/images/' . $adminData->foto }}" alt="">
            </div>
            <div class="ml-2" style="margin-right : 5rem">
                <br>
                <br>
                <p class="font-w-bold font-size-18 text-black mb-1 ">{{ $adminData->name }}</p>
                <p class="font-size-13 text-black">Administrator</p>
            </div>
        </div>
        <form action="/edit_akun" method="POST" class="form" enctype="multipart/form-data">
            @csrf
            <div class="input-container">
                <label for="nama" class="font-size-18 font-w-medium mb-2">Nama Profil</label>
                <input type="text" id="nama" name="nama" class="font-size-18" value="{{ $adminData->name }}">
            </div>
            <div class="input-container ">
                <label for="nama_daerah" class="font-size-18 font-w-medium mb-2">Foto</label>
                <div class="input-file-wrapper">
                    <img src="{{ url('/') . '/storage/images/' . $adminData->foto }}" alt="image-preview"
                        id="img-preview">
                    <p class="file-name mt-0-5 gray-text font-size-13 mb-2"
                        style="@empty($adminData->foto) display:none @endempty">{{ $adminData->foto }}
                    </p>
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
                <button class="btn primary-btn font-size-18" type="submit">Edit akun</button>
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
