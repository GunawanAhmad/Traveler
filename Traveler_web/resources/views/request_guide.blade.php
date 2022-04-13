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
    <link rel="stylesheet" href="{{ asset('css/request_guide.css') }}">
</head>

<body>
    <div class="container">
        <h1 class="font-size-72 b-line b-line-mid font-w-bold">Daftar Request</h1>
        <ul>
            @foreach ($data as $dataguide)
                <li class="wisata-container">
                    <a href="">
                        <img src="{{ asset('img/fotoAndira.jpg') }}" alt="">
                        <div class="tempat-info">
                            <p class="font-size-24 font-w-bold mb-1">{{ $dataguide->name }}</p>
                            <p class="gray-text"><span>
                                    <i class="fa-solid fa-location-dot"></i></span>{{ $dataguide->alamat }}</p>
                        </div>
                    </a>
                    <div class="action-btn" style="color:yellow">
                        <form action="/acc/{{ $dataguide->id }}" method="POST">
                            @csrf
                            <button type="submit">
                                <i class="fa-solid fa-check"></i>
                            </button>
                        </form>
                        <form action="/reject/{{ $dataguide->id }}" method="POST">
                            @csrf
                            <button type="submit">
                                <i class="fa-solid fa-x"></i>
                            </button>
                        </form>
                    </div>
                </li>
            @endforeach
        </ul>
    </div>
</body>

</html>
