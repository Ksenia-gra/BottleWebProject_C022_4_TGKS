//Обработчик для загрузки матрицы при загрузке страницы
window.addEventListener('load', () => {
    changeValue(0, 1, 2);
});

//Получаем по id элемент input 
const inputVertex = document.getElementById("vertex");

//Получаем по id списки с вершинами источника и стока
const selectSource = document.getElementById("source");
const selectStock = document.getElementById("stock");

//Обработчик списка источника при изменении выбора элемента в select
selectSource.addEventListener("change", (event) => {
    //Очищаем отрисованную матрицу
    document.getElementById("matrix").innerHTML = "";
    //Берем значение у выбранного элемента списка источника
    var source = selectSource.options[selectSource.selectedIndex].value;
    //Если элемент не число
    if (source != Number(source)) {
        //Ставим по умолчанию 1
        source = 1;
    }

    //Берем значение у выбранного элемента списка стока
    var stock = selectStock.options[selectStock.selectedIndex].value;
    //Если элемент не число
    if (stock != Number(stock)) {
        //Ставим по умолчанию последний элемент из списка в матрицу стоком
        stock = inputVertex.value;
    }

    //Вызов функции, генерирующая матрицу
    generateMatrix(parseInt(inputVertex.value), parseInt(source), parseInt(stock))
});

//Обработчик списка стока при изменении выбора элемента в select
selectStock.addEventListener("change", (event) => {
    //Очищаем отрисованную матрицу
    document.getElementById("matrix").innerHTML = "";
    //Берем значение у выбранного элемента списка источника
    var source = selectSource.options[selectSource.selectedIndex].value;
    //Если элемент не число
    if (source != Number(source)) {
        //Ставим по умолчанию 1
        source = 1;
    }

    //Берем значение у выбранного элемента списка стока
    var stock = selectStock.options[selectStock.selectedIndex].value;
    //Если элемент не число
    if (stock != Number(stock)) {
        //Ставим по умолчанию последний элемент из списка в матрицу стоком
        stock = inputVertex.value;
    }

    //Вызов функции, генерирующая матрицу
    generateMatrix(parseInt(inputVertex.value), parseInt(source), parseInt(stock))
});

// Обработчик события изменения количества вершин
function changeValue(change, source, stock) {
    // Получаем текущее значение элемента input
    var num = parseInt(inputVertex.value);
    // Вычисляем новое значение
    var newValue = num + change;
    // cоздаем новую матрицу
    if (newValue >= parseInt(inputVertex.min) && newValue <= parseInt(inputVertex.max)) {
        inputVertex.value = newValue;
        document.getElementById("matrix").innerHTML = "";
        if (source != Number(source) || source == null) {
            source = 1;
        }
        if (stock != Number(stock) || stock == null) {
            stock = newValue;
        }
        generateMatrix(newValue, source, stock);
    }
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
function generateMatrix(countVertices, source, stock) {

    //Создаем массив и сохраняем в него количество элементов
    var nums = []
    for (var i = 1; i <= countVertices; i++) {
        nums.push(i);
    }

    if (source > countVertices) {
        source = countVertices;
    }

    if (stock > countVertices) {
        stock = countVertices;
    }
    //Получаем по id таблицу и создаем элемент table для заполнения 
    const table = document.getElementById("matrix");
    const tbl = document.createElement('table');

    //Добавляем нумерацию столбцов
    for (let i = 0; i <= countVertices; i++) {
        const th = document.createElement('th');
        th.innerText = i ;
        th.style.textAlign = "center";
        if (i == 0) {
            th.innerText = "";
        }
        tbl.appendChild(th);
    }

    //Элемент первой строки матрицы
    var thFirst = document.createElement('th');
    thFirst.innerText = source;

    //Элемент последей строки матрицы
    var thLast = document.createElement('th');
    thLast.innerText = stock;

    //Удаление вершин источника и стока из массива всех вершин   
    if (source > stock) {
        nums.splice(source - 1, 1);
        nums.splice(stock - 1, 1);
    }
    else {
        nums.splice(source - 1, 1);
        nums.splice(stock - 2, 1);
    }
    

    //Добавляем нумерацию строк
    for (let i = 0; i < countVertices; i++) {
        const tr = tbl.insertRow();
        //
        if (i == 0) {
            tr.appendChild(thFirst);
        }
        //
        else if (i == countVertices - 1) {
            tr.appendChild(thLast);
        }
        //
        else {
            const th = document.createElement('th');
            th.innerText = nums[i - 1];
            tr.appendChild(th);
        }

        //Заполнение таблицы
        for (let j = 0; j < countVertices; j++) {

            //Создаем элемент input для ввода
            const input = document.createElement("input");
            //Создаем ячейки таблицы
            const td = document.createElement("td");
            //Задаем имя и стили для input
            input.name = "matrix[" + i + "][" + j + "]";
            input.style.width = '45px';
            input.style.height = '40px';
            input.style.textAlign = "center";
            //Делаем 0 по диагонали матрицы и делаем их только для чтения
            if (i == j) {
                input.value = 0;
                input.setAttribute('readonly', 'readonly');
            }
            //Обработчик ввода input
            $(input).on('change keyup paste', function () {
                txt = $(this).val();
                //Берём значение у аттрибута name
                name = $(this).attr("name");
                //Берем индексы для заполнения обратной ячейки
                firstNumber = name.split("[")[1].substring(0, 1);
                secondNumber = name.split("[")[2].substring(0, 1);
                //Ввод только цифры
                num = Number(txt)
                if (txt != '' && txt != num) {
                    //Что не является цифрой - удаляем
                    $(this).val('');
                }
                else if (txt == '') {
                    //Заполнение пустотой
                    $("input[name=\"matrix[" + secondNumber + "][" + firstNumber + "]\"]").val('');
                }
                else {
                    //Заполнение 0
                    $("input[name=\"matrix[" + secondNumber + "][" + firstNumber + "]\"]").val(0);
                }
            });
            //Добавляем в ячейки input
            td.appendChild(input);
            //Добавляем в строки ячейки
            tr.appendChild(td);
        }
    }
    //Добавление таблицы 
    table.appendChild(tbl);
}