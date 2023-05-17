% rebase('layout.tpl', title=title, year=year)

<h3 class ="titleAb">Наша команда</h3>
<br/>
    <p class="card-text infoText">
        Во время прохождения учебной практики в ФСПО ГУАП преподавателями Опалевой У.С. и Бартасевич И.Г. были составлены команды для выполнения различных заданий и интеграций программных модулей, пользуясь системой контроля версий. 
        <br/>
        Наша команда состоит из четырёх человек: <strong>Туманова Алиса,</strong> <strong>Графова Ксения,</strong> <strong>Кознюк София,</strong> <strong>Соколов Михаил</strong>.
    </p>
<div class="row">
    <div >
        <div class="card card-m p-4 shadow" id="cardOne">
            <div class="card-body">
                <img src="\static\images\photos\Alisa.png" class="card-title pic">
                    <p class="card-text fontAb">
                    Привет! Меня зовут <strong>Туманова Алиса</strong>!    <br/>
                    Основной моей деятельностью в этом проекте являлось реализация страницы    <br/> 
                    с решением задачи об "Отношении эквивалентности"   <br/>
                    и разработка дизайна главной страницы.  
                    </p>
            </div>

            <div class="d-flex p-4 icon">
                <a href="https://github.com/tumanovaalisa" >    
                    <img src ="\static\images\photos\GitHub.jpg" width = "80" height = "80">
                </a>
                 <a href="https://vk.com/bigtumka" >    
                    <img src ="\static\images\photos\VK.jpg" width = "70" height = "70">
                </a>
            </div>
        </div>
    </div>

   <!-- <div class="col">
        <div class="card card-bg-m shadow-lg border border-dark" id="mainCard">
            <div class="card-body">
                <div class="card theory-card">
                    <div class="card-body">
                        <h3 class="card-title text-center">Наша команда</h3>
                        
                        <p class="card-text">
                            Во время прохождения учебной практики в ФСПО ГУАП преподавателями Опалевой У.С. и Бартасевич И.Г. были составлены команды для выполнения различных заданий и интеграций программных модулей, пользуясь системой контроля версий. 
                            <br/>
                            Наша команда состоит из четырёх человек: <strong>Туманова Алиса,</strong> <strong>Графова Ксения,</strong> <strong>Кознюк София,</strong> <strong>Соколов Михаил</strong>.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>-->

    <div>
        <div class="card card-m p-4 shadow" id="cardTwo">
            <div class="card-body">
             <img src="\static\images\photos\Ksenia.jpg" class="card-title pic">
                <p class="card-text fontAb">
                     Всем привет! Я <strong>Графова Ксения</strong>!  <br/>
                     В моей функциональные обязанности входило решение   <br/>
                     задачи об "Ассиметричности бинарного отношения",  <br/>
                     и помимо этого я продумала и реализовала дизайн главной страницы.
                </p>
            </div>

            <div class="d-flex p-4 icon">
                <a href="https://github.com/Ksenia-gra">    
                <img src ="\static\images\photos\GitHub.jpg" width = "80" height = "80">
                </a>
                <a href="https://vk.com/jesusksu" >    
                    <img src ="\static\images\photos\VK.jpg" width = "70" height = "70">
                </a>
            </div>
        </div>
    </div>

</div>

<div class="row">
    <div class="col offset 3">
        <div class="card card-m p-4 shadow" id="cardThree">
            <div class="card-body">
              <img src="\static\images\photos\Sofa.jpg" class="card-title pic">
                <p class="card-text fontAb">
                    Приветствую! Меня зовут <strong>Кознюк София</strong>!  <br/>
                    Мною был реализован дизайн страницы "Об авторах"   <br/>
                    и придуман текст для описания моих коллег. Но, основной моей задачей  <br/>
                    было написать алгоритм для "Нахождения максимального потока в сети".
                </p>
            </div>
            <div class="d-flex p-4 icon">
                <a href="https://github.com/sofaackingsad" >
                    <img src ="\static\images\photos\GitHub.jpg" width = "80" height = "80">
                </a>
                <a href="https://vk.com/gay2012" >    
                    <img src ="\static\images\photos\VK.jpg" width = "70" height = "70">
                </a>
            </div>
        </div>
    </div> 

    <div >
        <div class="card card-m p-4 shadow" id="cardFour">
            <div class="card-body">
                 <img src="\static\images\photos\Misha.jpg" class="card-title pic">
                <p class="card-text fontAb">
                    Огромный привет! Я <strong>Соколов Михаил</strong>!  <br/>
                    Моей главной задачей было придумать и разработать решение для задания  <br/>
                    о "Гамильтоновых циклах". Я также не оставил без внимания страницу "Об авторах",  <br/>
                    и внес свой вклад в ее воплощение.
                </p>
            </div>
            <div class="d-flex p-4 icon">
                <a href="https://github.com/hawk0f">
                    <img src ="\static\images\photos\GitHub.jpg" width = "80" height = "80">
                </a>
                <a href="https://vk.com/hawk0f" >    
                    <img src ="\static\images\photos\VK.jpg" width = "70" height = "70">
                </a>
            </div>
        </div>
    </div>
</div>

<!--<script>

    $(document).ready(function() {
        var maxFirstRowWidth = Math.min($("#cardOne").width(), $("#cardTwo").width(),Math.min($("#cardFour").width(), $("#cardThree").width()))
        $("#cardOne").width(maxFirstRowWidth)
        $("#cardTwo").width(maxFirstRowWidth)
        $("#cardThree").width(maxFirstRowWidth)
        $("#cardFour").width(maxFirstRowWidth)
    })
</script>-->
