% rebase('layout.tpl', title=title, year=year)

<div class="row">
    <div class="col">
        <div class="card card-m p-4 shadow" id="cardOne">
            <div class="card-body">
                <h3 class="card-header"><strong>Туманова Алиса</strong></h5>
                
                <p class="card-text">
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ab soluta atque maiores similique natus, alias iure architecto velit, minima numquam porro voluptate, sunt hic repudiandae? Facilis reiciendis sunt laudantium quidem!    
                </p>
            </div>

            <div class="d-flex p-4">
                <a href="https://github.com/tumanovaalisa" class="btn btn-dark">GitHub ></a>
            </div>
        </div>
    </div>

    <div class="col-5">
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
    </div>

    <div class="col">
        <div class="card card-m p-4 shadow" id="cardTwo">
            <div class="card-body">
                <h3 class="card-header"><strong>Графова Ксения</strong></h5>
                
                <p class="card-text">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Explicabo pariatur ipsum alias. Soluta error veritatis expedita sequi eaque, laudantium dignissimos a voluptatem eos veniam est eius deleniti, ex cupiditate eligendi?    
                </p>
            </div>

            <div class="d-flex p-4">
                <a href="https://github.com/Ksenia-gra" class="btn btn-dark">GitHub ></a>
            </div>
        </div>
    </div>

</div>

<div class="row">
    <div class="col">
        <div class="card card-m p-4 shadow" id="cardThree">
            <div class="card-body">
                <h3 class="card-header"><strong>Кознюк София</strong></h5>
                
                <p class="card-text">
                    Lorem ipsum, dolor sit, amet consectetur adipisicing elit.   
                </p>
            </div>

            <div class="d-flex p-4">
                <a href="https://github.com/sofaackingsad" class="btn btn-dark">GitHub ></a>
            </div>
        </div>
    </div>

    <div class="col">
        <div class="card card-m p-4 shadow" id="cardFour">
            <div class="card-body">
                <h3 class="card-header"><strong>Соколов Михаил</strong></h5>
                
                <p class="card-text">
                    Lorem ipsum dolor sit amet 
                </p>
            </div>

            <div class="d-flex p-4">
                <a href="https://github.com/hawk0f" class="btn btn-dark">GitHub ></a>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        var maxFirstRowHeight = Math.max($("#cardOne").height(), $("#cardTwo").height(), 
                                Math.max($("#cardFour").height(), $("#cardThree").height(), $("#mainCard").height()))
        $("#cardOne").height(maxFirstRowHeight)
        $("#cardTwo").height(maxFirstRowHeight)
        $("#cardThree").height(maxFirstRowHeight)
        $("#cardFour").height(maxFirstRowHeight)
        $("#mainCard").height(maxFirstRowHeight)
    })
</script>