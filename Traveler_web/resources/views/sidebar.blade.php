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
    <link rel="stylesheet" href="{{ asset('css/sidebar.css') }}">

</head>

<body id="sidebar-body">
    <div id="sidebar" class="hide">
        <div>
            <div class="user-info flex flex-center justify-content-between">
                <div class="img-container">
                    <img src="{{ url('/') . '/storage/images/' . auth()->user()->foto }}" alt="">
                </div>
                <div class="ml-1">
                    <p class="font-w-bold font-size-18 text-white mb-1">{{ auth()->user()->name }}</p>
                    <p class="font-size-13 text-white">Administrator</p>
                </div>
            </div>
            <ul class="mt-1">
                <li><a href="/" class="text-white font-size-18 font-w-bold">Menu</a></li>
                <li><a href="Edit_Akun" class="text-white font-size-18 font-w-bold">Edit Akun</a></li>
            </ul>
        </div>
        <div>
            <form action="/logout" method="POST">
                @csrf
                <button type="submit" class="btn text-white font-w-bold font-size-18" id="logout-btn">Logout</button>
            </form>
        </div>
        <button class="sidebar-toggle" onclick="show_sidebar()">
            <span>
                <i class="fa-solid fa-arrow-right"></i>
            </span>
        </button>
    </div>

    <div id="bg-cover" class="hide" onclick="close_sidebar()"></div>

    <script>
        function show_sidebar() {
            document.querySelector('#sidebar').classList.remove("hide")
            document.querySelector('.sidebar-toggle').classList.add("hide")
            document.querySelector('#bg-cover').classList.remove('hide')
        }

        function close_sidebar() {
            document.querySelector('#sidebar').classList.add("hide")
            document.querySelector('.sidebar-toggle').classList.remove("hide")
            document.querySelector('#bg-cover').classList.add('hide')
        }
    </script>
</body>

</html>
