<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="/static/content/site.css" rel="stylesheet">
    <link href="/static/content/layout.css" rel="stylesheet">
    <link href="/static/content/index.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/content/about.css">
    <link rel="stylesheet" href="/static/content/max_flow.css">
    <link rel="stylesheet" href="/static/content/hamiltonian_cycle.css">
    <link href="/static/content/bin_relation_transitivity.css" rel="stylesheet">
    <script src="/static/scripts/local_scripts/validation_hamiltonian.js"></script>
    <script src="/static/scripts/local_scripts/max_flow.js"></script>
    <link rel="stylesheet" href="/static/content/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow">
  <div class="container-fluid">
    <a class="navbar-brand " href="/home">
        <img src="/static/images/logo_with_title.png" alt="" height="55" class="d-inline-block align-text-center">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse justify-content-end mr-auto" id="navbarSupportedContent" >
      <ul class="navbar-nav mb-2 mb-lg-0 navbar-right">
        
        <li class="nav-item dropdown ">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Решение задач
          </a>
          <ul class="dropdown-menu dropdown-menu-end " aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#" >Отношение эквивалентности</a></li>
            <li><a class="dropdown-item" href="/bin_relation_transitivity" >Ассиметричность бинарного отношения</a></li>
            <li><a class="dropdown-item" href="/maximum_flow" >Максимальный поток в сети</a></li>
            <li><a class="dropdown-item" href="/hamiltonian_cycle">Поиск Гамильтоновых циклов</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/about">Об авторах</a>
        </li>
      </ul>
      
    </div>
  </div>
</nav>

    <div class="container body-content">
        {{!base}}
        <hr />
        <footer>
            <p>&copy; {{ year }} - BottleWebProject_C022_4_TGKS</p>
        </footer>
    </div>

    
   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
