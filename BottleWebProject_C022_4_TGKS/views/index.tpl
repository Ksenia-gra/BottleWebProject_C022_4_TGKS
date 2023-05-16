% rebase('layout.tpl', title='Главная', year=year)

<div class="card index-card shadow-lg border border-dark">
  <div class="card-body">
    <div class="card theory-card">
    <div class="card-body">
    <h3 class="card-title">Теория графов</h3>
    <p class="card-text">Теория графов — обширный раздел дискретной математики, в котором системно изучают свойства графов.
Теория графов широко применяется в решении экономических и управленческих задач, в программировании, химии, конструировании и изучении электрических цепей, коммуникации, психологии, социологии, лингвистике и в других областях.</p>
    
    <div class="collapse" id="collapseCard">
        <h5>
        Для чего строят графы
        </h5>
        <p>Чтобы отобразить отношения на множествах. По сути, графы помогают визуально представить всяческие сложные взаимодействия: аэропорты и рейсы между ними, разные отделы в компании, молекулы в веществе. 
        <h5>
        Граф
        </h5>
        </p>
        <img src="/static/images/graf_img.png" alt="" height="300" class="d-inline-block align-center">
        <p>
        Графом называется система объектов произвольной природы (вершин) и связок (ребер), соединяющих некоторые пары этих объектов. 
        Граф — это геометрическая фигура, которая состоит из точек и линий, которые их соединяют. Точки называют вершинами графа, а линии — ребрами. 
        </p>
            <ul>
                  <li>Два ребра называются <strong>смежными</strong>, если у них есть общая вершина. </li>
                  <li>Два ребра называются <strong>кратными</strong>, если они соединяют одну и ту же пару вершин. </li>
                  <li>Ребро называется <strong>петлей</strong>, если его концы совпадают. </li>
                  <li><strong>Степенью вершины </strong>называют количество ребер, для которых она является концевой (при этом петли считают дважды).  </li>
                  <li>Вершина называется <strong>изолированной</strong>, если она не является концом ни для одного ребра. </li>
                  <li>Вершина называется <strong>висячей</strong>, если из неё выходит ровно одно ребро. </li>
                  <li>Граф без кратных ребер и петель называется <strong>обыкновенным</strong></li>
            </ul>
        </div>
    <div class="d-flex justify-content-end">
        <button class="btn btn-link link-dark" data-bs-toggle="collapse" id="readMoreBtn" data-bs-target="#collapseCard" aria-expanded="false">Читать далее</button>
    </div>
  </div>
    </div>
  </div>
</div>

<div class="row">
    <div class="col-md-4">
    <div class="card">
    <h2>Getting started</h2>
        <p>
            Bottle gives you a powerful, patterns-based way to build dynamic websites that
            enables a clean separation of concerns and gives you full control over markup
            for enjoyable, agile development.
        </p>
        <p><a class="btn btn-default" href="http://bottlepy.org/docs/dev/index.html">Learn more &raquo;</a></p>

    <div class="col-md-4">
        <h2>Get more libraries</h2>
        <p>The Python Package Index is a repository of software for the Python programming language.</p>
        <p><a class="btn btn-default" href="https://pypi.python.org/pypi">Learn more &raquo;</a></p>
    </div>
  
     
</div>

<script>
    $(document).ready(function() {
        const readMore = "Читать далее" 
        $("#readMoreBtn").click(function(){
            $(this).text($(this).text() == readMore ? "Свернуть" : readMore)
        })
    })
</script>