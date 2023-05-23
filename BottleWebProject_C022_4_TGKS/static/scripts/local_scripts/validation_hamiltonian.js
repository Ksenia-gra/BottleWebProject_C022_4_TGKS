// Функция для создания таблицы смежности
function printMatrix(numVertices) {
    //По id получаем тело table 
    var tbody = document.getElementById("matrix");
    // Проходимся циклом для добавления строк матрицы
    for (var i = 0; i < numVertices; i++) {
        var tr = document.createElement("tr");
        //Проходимся циклом для добавления ячеек в table
        for (var j = 0; j < numVertices; j++) {
            // Создаем элемент ячейки
            var td = document.createElement("td");
            // Свойство для отображения ячеек
            td.style.display = "inline-block";
            //Создаем элемент input
            var input = document.createElement("input");
            // Свойства для input
            input.name = "matrix[" + i + "][" + j + "]";
            input.type = 'text';
            input.style.width = '30px';
            input.style.height = '30px';
            input.style.textAlign = "center";
            // Выводим в матрицу 0 по диагонали 
            if (i == j) {
                input.value = '0';
                input.setAttribute("readonly", "readonly");
            }

            //Обработчик события для ввода input
            $(input).on('change keyup paste', function () {
                txt = $(this).val();
                name = $(this).attr("name");
                // Получаем индексы для заполнения обратной ячейки
                firstNum = name.split("[")[1].substring(0, 1);

                secondNum = name.split("[")[2].substring(0, 1);

                // Проверки на ввод и добавлене корректных значений в ячейки
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

            //Добавляем ячейки и строки
            td.appendChild(input);
            tr.appendChild(td);
        }
        // Добавляем таблицу целиком 
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