% rebase('layout.tpl', title='Антитранзитивность бинарного отношения', year=year)

<div class="card p-4 shadow-lg border border-dark title-card">

<div class="card-body">

<h4 class="card-title text-light">Определение ассиметричности и антитранзитивности бинарного отношения</h4>
<h4 class="card-title text-light">Нахождение обратного бинарного отношения</h4>
<br>
       
<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active me-3 mt-1" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Ассиметричность графа</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link me-3 mt-1" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Антитранзитивность графа</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link me-3 mt-1" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Обратное бинарное отношение</button>
  </li>
</ul>
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active nav-btn fs-6" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab"><strong>Ассиметричность</strong> это свойство, которое говорит, что если две вершины имеют отношение друг к другу, то обратное отношение между ними не может быть истиной.
               </div>
  <div class="tab-pane fade nav-btn fs-6" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab"><strong>Антитранзитивность </strong> - это свойство, которое говорит, что если одна вершина имеет отношение к другой вершине, а другая вершина имеет отношение к третьей вершине, то первая вершина не может иметь отношение к третьей 
                вершине.</div>
  <div class="tab-pane fade nav-btn fs-6" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab"><strong>Обратное бинарное отношение</strong> получается путем транспонирования исходной матрицы смежности.</div>


 </div>
</div>
</div>

<div class="card p-4 shadow border border-black">
<div class="card-body">
<div class="alert alert-secondary d-flex align-items-center" role="alert">
<i class="fa fa-info-circle fs-1 me-3" aria-hidden="true"></i>
  Сначала выберите количество вершин, потом в появившиеся поля вводите значения матрицы смежности графа
</div>
    <h3 class="card-title text-center"><strong>Решение задачи</strong></h5>
    
<form method="post" action="/bin_relation_transitivity" class="text-center">

    <label for="vertices" >Введите количество вершин:</label>
    <br><br>

<button type="button" class="button p-1 bg-black" onclick="changeValue(-1)">–</button>
<input type="number" name="vertices" id="vertices" min="2" max="10" value="2" readonly class="raz ">
<button type="button"  class="button p-1 bg-black" onclick="changeValue(1)">+</button>
<br><br>

<label>Введите матрицу смежности:</label>
<br>
<table class="centerTable">
<tbody id="matrix">
</tbody>
</table>
<br>
<input type="submit" class="btn btn-outline-dark mt-1" value="Вывести матрицу">
<input type="submit" class="btn btn-outline-dark mt-1" value="Проверить ассиметричность">
<input type="submit" class="btn btn-outline-dark mt-1" value="Проверить антитранзитивность">
<input type="submit" class="btn btn-outline-dark mt-1" value="Найти обратную матрицу">
</form>
<div class="d-flex justify-content-center">
<table class="table table-bordered text-center mt-3">
    <thead>
   
    <tr>

     <th class="text-white">#</th>

      % for i in range(len(matrix)):
      <th>{{i+1}}</th>
       % end
    </tr>
  </thead>
    <tbody>
   
        % i = 0
        % for row in matrix:
        <tr>
        
            <th scope="row">{{i+1}}</th>
      
            % for cell in row:
            
        <td>{{cell}}</td>
            % end

        </tr>
       %i += 1
% end
</tbody>
</table>

</div>
</div>
</div>
<script>
// Функция для создания таблицы смежности
function createMatrix(numVertices) {
    var tbody = document.getElementById("matrix");
    for (var i = 0; i < numVertices; i++) {
        var tr = document.createElement("tr");
        for (var j = 0; j < numVertices; j++) {
            var td = document.createElement("td");
            var input = document.createElement("input");
            input.type = "checkbox";
            $(input).addClass('form-check-input')
            $(input).val(1)
            input.name = "matrix[" + i + "][" + j + "]";
            input.style.width='50px';
            input.style.height='50px';

            td.appendChild(input);
            tr.appendChild(td);
        }
        tbody.appendChild(tr);
    }
}
// Обработчик события изменения количества вершин
function changeValue(change) {
    // Получаем элемент input с помощью его ID
    var input = document.getElementById("vertices");
    // Получаем текущее значение элемента input
    var currentValue = parseInt(input.value);
    // Вычисляем новое значение
    var newValue = currentValue + change;
    // Проверяем, что новое значение находится в допустимом диапазоне (min, max)
    if (newValue >= parseInt(input.min) && newValue <= parseInt(input.max)) {
      // cоздаем новую матрицу
      input.value = newValue;
      document.getElementById("matrix").innerHTML = "";
        createMatrix(newValue);
    }
  }

  $(document).ready(function(){
    createMatrix(2)
  });
  $(document).ready(function(){
    $('#matrix input').on('change keyup paste',function(){
    console.log($(this).val(1));
    })
  });
</script>
