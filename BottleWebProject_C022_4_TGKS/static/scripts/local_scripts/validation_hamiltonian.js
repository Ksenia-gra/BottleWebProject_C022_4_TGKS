// Функция для создания таблицы смежности
function printMatrix(numVertices) {
    var tbody = document.getElementById("matrix");
    for (var i = 0; i < numVertices; i++) {
        var tr = document.createElement("tr");
        for (var j = 0; j < numVertices; j++) {
            var td = document.createElement("td");
            td.style.display = "inline-block";
            var input = document.createElement("input");
            input.name = "matrix[" + i + "][" + j + "]";
            input.type = 'text';
            input.style.width = '30px';
            input.style.height = '30px';
            input.style.textAlign = "center";
            if (i == j) {
                input.value = '0';
                input.setAttribute("readonly", "readonly");
            }

            $(input).on('change keyup paste', function () {
                txt = $(this).val();
                name = $(this).attr("name");

                firstNum = name.split("[")[1].substring(0, 1);

                secondNum = name.split("[")[2].substring(0, 1);

                if (txt == '')
                {
                    $("input[name=\"matrix[" + secondNum + "][" + firstNum + "]\"]").val('');
                }
                else if (txt != "0" && txt != "1") {
                    $(this).val('');
                }
                else {
                    $("input[name=\"matrix[" + secondNum + "][" + firstNum + "]\"]").val(txt);
                }
            })

            td.appendChild(input);
            tr.appendChild(td);
        }
        tbody.appendChild(tr);
    }
}

// Обработчик события изменения количества вершин
function changeVerticesNum(change) {
    // Получаем элемент input с помощью его ID
    var input = document.getElementById("amountOfVertices");
    // Получаем текущее значение элемента input
    var currentValue = parseInt(input.value);

    // cоздаем новую матрицу
    input.value = currentValue;
    document.getElementById("matrix").innerHTML = "";
    printMatrix(currentValue);
}