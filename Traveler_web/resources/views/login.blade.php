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
    <link rel="stylesheet" href="{{ asset('css/login.css') }}">
</head>

<body>
    <main>
        <div class="container">
            <h1 class="font-size-72 mb-3 b-line b-line-mid">Traveler</h1>
            <form action="">
                <input type="email" placeholder="Email" class="input form-input mb-1 bg-primary" id="email" name="email">
                <input type="password" placeholder="Password" class="input form-input mb-1 bg-primary" id="password"
                    name="password">
                <button type="submit"
                    class="btn primary-btn mx-auto d-block bg-primary text-white font-size-13">Login</button>
            </form>
        </div>
    </main>

</html>
