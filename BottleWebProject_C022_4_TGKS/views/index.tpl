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
        <img src="/static/images/graf.png" alt="" height="300" class="d-inline-block align-center">
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
    <div class="col-md-6">
        <div class="card func-card p-4 shadow" id="cardOne">
            
            <div class="card-body">
                <h3 class="card-title"><strong>Отношение эквивалентности</strong></h5>
                <p class="card-text">
                <strong>Бинарное отношение</strong> – R на множестве Х называется отношением эквивалентности, если оно обладает следующими свойствами:
                
                </p>
                <ul>
                <li><strong>Рефлексивность</strong> – ∀𝑥 ∈ 𝐴, (𝑥, 𝑥) ∈ 𝑃 – У всех вершин есть петли;</li>
                <li><strong>Симметричность</strong> – ∀𝑥, 𝑦 ∈ 𝐴, 𝑥𝑃𝑦 ⇒ 𝑦𝑃𝑥 – Если есть связь между вершинами, то обязательно в обе стороны;
                </li>
                <li><strong>Транзитивность</strong> – ∀𝑥, 𝑦, 𝑧 ∈ 𝐴, 𝑥𝑃𝑦 и 𝑦𝑃𝑧 ⇒ 𝑥𝑃𝑧 – Если две вершины связаны через посредника, то они также будут связаны и напрямую.
                
                </li>
                </ul>
                
                
                <p class="card-text">
                Если заданное бинарное отношение будет удовлетворять всем условиям, то отношение будет эквивалентным.
                </p>
            </div>
            <div class="d-flex p-4">
                <a href="/bin_relation_equality" class="btn btn-dark">Перейти к задаче ></a>
                </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card func-card p-4 shadow" id="cardTwo">
           
            <div class="card-body">
                <h3 class="card-title"><strong>Ассиметричность бинарного отношения</strong></h5>
                <p class="card-text">
                <strong>Ассиметричность</strong> это свойство, которое говорит, что если две вершины имеют отношение друг к другу, то обратное отношение между ними не может быть истиной.
                </p>
                <p class="card-text">
                <strong>Антитранзитивность </strong> - это свойство, которое говорит, что если одна вершина имеет отношение к другой вершине, а другая вершина имеет отношение к третьей вершине, то первая вершина не может иметь отношение к третьей 
                вершине.</p>
                <p class="card-text">
                <strong>Обратное бинарное отношение</strong> получается путем транспонирования исходной матрицы смежности.
                </p>
            </div>
            <div class="d-flex p-4">
                <a href="/bin_relation_transitivity" class="btn btn-dark">Перейти к задаче ></a>
                </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="card func-card p-4 shadow" id="cardThree">
           
            <div class="card-body">
                <h3 class="card-title"><strong>Максимальный поток в сети</strong></h5>
                <p class="card-text">
                Функция f называется <strong>потоком в сети N</strong>, если она удовлетворяет условиям: 
                
                </p>
                <ul>
                <li><strong>Ограниченности</strong>: поток по любой дуге сети не превосходит пропускной способности этой дуги: 0 ≤ 𝑓(𝑒) ≤ 𝑐(𝑒) для каждой дуги e; 
                </li>
                <li><strong>Сохранения</strong>: суммарный поток, заходящий в любую вершину сети (кроме истока и стока), равен суммарному потоку, выходящему из этой вершины:
                𝑓+(𝑥) = 𝑓−(𝑥) для каждой внутренней вершины x.</li>
                </ul>
                <p>
                Задача о максимальном потоке состоит в том, чтобы для данной сети найти <strong>поток наибольшей величины</strong>.
                </p>
                
            </div>
            <div class="d-flex p-4">
                <a href="#" class="btn btn-dark">Перейти к задаче ></a>
                </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card func-card p-4 shadow" id="cardFour">
            
            <div class="card-body">
                <h3 class="card-title"><strong>Поиск Гамильтонова цикла</strong></h5>
                <p class="card-text">
                Цикл (цепь) в графе G называется <strong>Гамильтоновым</strong>, если он проходит через каждую вершину графа G ровно один раз.
                </br>
                </br>
                Граф G называется <strong>полным</strong>, если каждая его вершина является смежной со всеми остальными вершинами. В полном графе <strong>всегда существуют</strong> гамильтоновы циклы.
                </br>
                </br>
                Также <strong>необходимым условием</strong> существования гамильтонова цикла является связность графа.
                </p>
                
            </div>
            <div class="d-flex p-4">
                <a href="/hamiltonian" class="btn btn-dark">Перейти к задаче ></a>
                </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        const readMore = "Читать далее" 
        $("#readMoreBtn").click(function(){
            $(this).text($(this).text() == readMore ? "Свернуть" : readMore)
        });

        var maxFirstRowHeight = Math.max($("#cardOne").height(), $("#cardTwo").height(),Math.max($("#cardFour").height(), $("#cardThree").height()))
        $("#cardOne").height(maxFirstRowHeight)
        $("#cardTwo").height(maxFirstRowHeight)
        $("#cardThree").height(maxFirstRowHeight)
        $("#cardFour").height(maxFirstRowHeight)
    })
</script>