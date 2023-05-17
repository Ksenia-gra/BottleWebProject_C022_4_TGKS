% rebase('layout.tpl', title='Антитранзитивность бинарного отношения', year=year)


<form method="post" action="/bin_relation_transitivity">
    <label for="vertices">Введите количество вершин:</label>
<input type="number" name="vertices" id="vertices" min="1">

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
document.getElementById("vertices").addEventListener("keyup", function() {
var numVertices = parseInt(this.value);
if (!isNaN(numVertices)) {
    document.getElementById("matrix").innerHTML = "";
createMatrix(numVertices);
}
});
</script>
