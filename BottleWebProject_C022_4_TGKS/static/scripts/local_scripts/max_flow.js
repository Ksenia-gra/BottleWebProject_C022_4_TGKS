// Обработчик события изменения количества вершин
function changeValue(change) {
    // Получаем элемент input с помощью его ID
    var inputVertex = document.getElementById("vertex");
    // Получаем текущее значение элемента input
    var num = parseInt(inputVertex.value);
    // Вычисляем новое значение
    var newValue = num + change;

    // cоздаем новую матрицу
    inputVertex.value = newValue;
    document.getElementById("matrix").innerHTML = "";
    generateMatrix(newValue);
}

// Обработчик события изменения списка 
function removeOptions() {
    //Получаем по id список вершин источника и стока
    var selectSource = document.getElementById("source");
    var selectStock = document.getElementById("stock");
    //Получаем по id элемент текстого поля 
    var inputVertex = document.getElementById("vertex");
    //Получаем текущее значение в текстовом поле и парсим его в Int
    var num = parseInt(inputVertex.value);
    //Создаем элемент списка
    var optionSource = document.createElement("option");
    var optionStock = document.createElement("option");
    
    //Циклом проходимся по списку источника
    for (var i = selectSource.options.length - 1; i >= 0; i--) {
        //Получаем элементы списка источника
        var optionValue = parseInt(selectSource.options[i].value);
        //Если элементов больше, чем в заданном текстовом поле
        if (optionValue >= num) {
            //Вырезаем до заданного числа элементы
            selectSource.remove(i);
        }
        //Если элементов меньше, чем в заданном текстовом поле
        else if (optionValue <= num) {
            //Задаем элементу значение и текст
            optionSource.value = (num).toString();
            optionSource.text = (num).toString();
            //Добавляем
            selectSource.append(optionSource);
        }
    }

    //Циклом проходимся по списку стоков
    for (var j = selectStock.options.length - 1; j >= 0; j--) {
        //Получаем элементы списка стока
        var optionValues = parseInt(selectStock.options[j].value);
        //Если элементов больше, чем в заданном текстовом поле
        if (optionValues >= num) {
            //Вырезаем до заданного числа элементы
            selectStock.remove(j);
        }
        //Если элементов меньше, чем в заданном текстовом поле
        else if (optionValues <= num) {
            //Задаем элементу значение и текст
            optionStock.value = (num).toString();
            optionStock.text = (num).toString();
            //Добавляем
            selectStock.append(optionStock);
        }
    }
}

//Создание матрицы
function generateMatrix(countVertices) {
    const table = document.getElementById("matrix");
    const tbl = document.createElement('table');
    for (let i = 0; i < countVertices; i++) {
        const tr = tbl.insertRow();
        for (let j = 0; j < countVertices; j++) {
            const input = document.createElement("input");
            const td = document.createElement("td");
            input.name = "matrix[" + i + "][" + j + "]";
            input.style.width = '45px';
            input.style.height = '40px';
            td.style.border = '1px solid black';
            td.appendChild(input);
            tr.appendChild(td);
        }
    }
    table.appendChild(tbl);
}
