// Функция для создания таблицы смежности
function createMatrix(numVertices) {
    var tbody = document.getElementById("matrix");
    for (var i = 0; i < numVertices; i++) {
        var tr = document.createElement("tr");
        for (var j = 0; j < numVertices; j++) {
            var td = document.createElement("td");
            var input = document.createElement("input");
            input.type = "text";
            input.name = "matrix[" + i + "][" + j + "]";
            input.style.width='50px';
            $(input).on('change keyup paste', function() {
                txt = $(this).val()
                if (txt != "0" && txt != "1")
                {
                    $(this).val("")
                }
            })
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

    // cоздаем новую матрицу
    input.value = currentValue;
    document.getElementById("matrix").innerHTML = "";
    createMatrix(currentValue);
}