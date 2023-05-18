% rebase('layout.tpl', title='Антитранзитивность бинарного отношения', year=year)

<div class="card p-4 shadow-lg border border-dark title-card">

<div class="card-body">

<h5 class="card-title text-light">Определение ассиметричности и антитранзитивности бинарного отношения</h5>
<h5 class="card-title text-light">Нахождение обратного бинарного отношения</h5>
<br>
        <button class="btn bg-white " data-bs-toggle="collapse" id="readMoreBtn" data-bs-target="#collapseCard" aria-expanded="false">Ассиметричность графа</button>
<div class="collapse" id="collapseCard">
<p class="text-light">kcklclklkv</p>
</div>
</div>
</div>
<div class="card p-4 shadow">
<div class="card-body">
    <h3 class="card-title"><strong>Решение задачи</strong></h5>

<form method="post" action="/bin_relation_transitivity">
    <label for="vertices">Введите количество вершин:</label>
    <br><br>

<button type="button" class="button p-2 bg-black" onclick="changeValue(-1)">-</button>
<input type="number" name="vertices" id="vertices" min="0" max="10" value="0" readonly class="raz ">
<button type="button"  class="button p-2 bg-black" onclick="changeValue(1)">+</button>
<br><br>

<label>Введите матрицу смежности:</label>
<br>
<table>
<tbody id="matrix">
</tbody>
</table>
<br>
<input type="submit" value="Отправить">
</form>
<table class="table">
    <thead>
    <tr>
      % for i in range(len(matrix)):
      <th>{{i+1}}</th>
       % end
    </tr>
  </thead>
    <tbody>
        
        % for row in matrix:

        <tr>

            % for cell in row:
        <td>{{cell}}</td>
            % end
        </tr>
% end
</tbody>
</table>

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
            input.type = "number";
            input.name = "matrix[" + i + "][" + j + "]";
            input.style.width='50px';
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

</script>
