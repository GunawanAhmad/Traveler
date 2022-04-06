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
                <select class="form-control font-size-18" tabindex="-98" name="regional_code" required="">
                    <option value="11">
                        ACEH
                    </option>
                    <option value="12">
                        SUMATERA UTARA
                    </option>
                    <option value="13">
                        SUMATERA BARAT
                    </option>
                    <option value="14">
                        R I A U
                    </option>
                    <option value="15">
                        J A M B I
                    </option>
                    <option value="16">
                        SUMATERA SELATAN
                    </option>
                    <option value="17">
                        BENGKULU
                    </option>
                    <option value="18">
                        LAMPUNG
                    </option>
                    <option value="19">
                        KEPULAUAN BANGKA BELITUNG
                    </option>
                    <option value="21">
                        KEPULAUAN RIAU
                    </option>
                    <option value="31">
                        DKI JAKARTA
                    </option>
                    <option value="32">
                        JAWA BARAT
                    </option>
                    <option value="33">
                        JAWA TENGAH
                    </option>
                    <option value="34">
                        DI YOGYAKARTA
                    </option>
                    <option value="35">
                        JAWA TIMUR
                    </option>
                    <option value="36">
                        B A N T E N
                    </option>
                    <option value="51">
                        BALI
                    </option>
                    <option value="52">
                        NUSA TENGGARA BARAT
                    </option>
                    <option value="53">
                        NUSA TENGGARA TIMUR
                    </option>
                    <option value="61">
                        KALIMANTAN BARAT
                    </option>
                    <option value="62">
                        KALIMANTAN TENGAH
                    </option>
                    <option value="63">
                        KALIMANTAN SELATAN
                    </option>
                    <option value="64">
                        KALIMANTAN TIMUR
                    </option>
                    <option value="71">
                        SULAWESI UTARA
                    </option>
                    <option value="73">
                        SULAWESI SELATAN
                    </option>
                    <option value="74">
                        SULAWESI TENGGARA
                    </option>
                    <option value="75">
                        GORONTALO
                    </option>
                    <option value="76">
                        SULAWESI BARAT
                    </option>
                    <option value="81">
                        MALUKU
                    </option>
                    <option value="82">
                        MALUKU UTARA
                    </option>
                    <option value="94">
                        PAPUA
                    </option>
                    <option value="91">
                        PAPUA BARAT
                    </option>
                    <option value="72">
                        SULAWESI TENGAH
                    </option>
                    <option value="65">
                        KALIMANTAN UTARA
                    </option>
                </select>
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
