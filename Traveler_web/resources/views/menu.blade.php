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
    <link rel="stylesheet" href="{{ asset('css/menu.css') }}">
</head>

<body>
    <div class="container">
        <h1 class="font-size-72 b-line b-line-mid font-w-bold">Traveler</h1>
        <div class="menu-wrapper">
            <a class="menu-container">
                <div class="icon font-size-72">
                    <i class="fa-solid fa-rectangle-list"></i>
                </div>
                <div class="menu-description">
                    <p class="font-size-18 font-w-bold">Data Wisata</p>
                </div>
            </a>
            <a class="menu-container">
                <div class="icon font-size-72">
                    <i class="fa-solid fa-plus"></i>
                </div>
                <div class="menu-description">
                    <p class="font-size-18 font-w-bold">Tambah Wisata</p>
                </div>
            </a>
            <a class="menu-container">
                <div class="icon font-size-72">
                    <i class="fa-solid fa-id-badge"></i>
                </div>
                <div class="menu-description">
                    <p class="font-size-18 font-w-bold">Data Tour Guide</p>
                </div>
            </a>
            <a class="menu-container">
                <div class="icon font-size-72">
                    <i class="fa-solid fa-clipboard-check"></i>
                </div>
                <div class="menu-description">
                    <p class="font-size-18 font-w-bold">Data Request Tour Guide</p>
                </div>
            </a>
        </div>
    </div>
</body>

</html>
