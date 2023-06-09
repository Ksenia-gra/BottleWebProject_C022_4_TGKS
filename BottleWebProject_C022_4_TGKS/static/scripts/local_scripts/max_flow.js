//���������� ��� �������� ������� ��� �������� ��������
window.addEventListener('load', () => {
    var tBody = document.getElementById("matrix")
    if (tBody.childElementCount === 0) {
        changeValue(0, 1, 2);
    }
});

//�������� �� id ������� input 
const inputVertex = document.getElementById("vertex");

//�������� �� id ������ � ��������� ��������� � �����
const selectSource = document.getElementById("source");
const selectStock = document.getElementById("stock");

//���������� ������ ��������� ��� ��������� ������ �������� � select
selectSource.addEventListener("change", (event) => {
    //������� ������������ �������
    document.getElementById("matrix").innerHTML = "";
    //����� �������� � ���������� �������� ������ ���������
    var source = selectSource.options[selectSource.selectedIndex].value;
    //���� ������� �� �����
    if (source != Number(source)) {
        //������ �� ��������� 1
        source = 1;
    }

    //����� �������� � ���������� �������� ������ �����
    var stock = selectStock.options[selectStock.selectedIndex].value;
    //���� ������� �� �����
    if (stock != Number(stock)) {
        //������ �� ��������� ��������� ������� �� ������ � ������� ������
        stock = inputVertex.value;
    }

    //����� �������, ������������ �������
    generateMatrix(parseInt(inputVertex.value), parseInt(source), parseInt(stock))
});

//���������� ������ ����� ��� ��������� ������ �������� � select
selectStock.addEventListener("change", (event) => {
    //������� ������������ �������
    document.getElementById("matrix").innerHTML = "";
    //����� �������� � ���������� �������� ������ ���������
    var source = selectSource.options[selectSource.selectedIndex].value;
    //���� ������� �� �����
    if (source != Number(source)) {
        //������ �� ��������� 1
        source = 1;
    }

    //����� �������� � ���������� �������� ������ �����
    var stock = selectStock.options[selectStock.selectedIndex].value;
    //���� ������� �� �����
    if (stock != Number(stock)) {
        //������ �� ��������� ��������� ������� �� ������ � ������� ������
        stock = inputVertex.value;
    }

    //����� �������, ������������ �������
    generateMatrix(parseInt(inputVertex.value), parseInt(source), parseInt(stock))
});

// ���������� ������� ��������� ���������� ������
function changeValue(change, source, stock) {
    // �������� ������� �������� �������� input
    var num = parseInt(inputVertex.value);
    // ��������� ����� ��������
    var newValue = num + change;
    // c������ ����� �������
    if (newValue >= 2 && newValue <= 10) {
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

// ���������� ������� ��������� ������ 
function removeOptions() {

    //�������� �� id ������ ������ ��������� � �����
    var selectSource = document.getElementById("source");
    var selectStock = document.getElementById("stock");
    //�������� �� id ������� �������� ���� 
    var inputVertex = document.getElementById("vertex");
    //�������� ������� �������� � ��������� ���� � ������ ��� � Int
    var num = parseInt(inputVertex.value);
    //������� ������� ������
    var optionSource = document.createElement("option");
    var optionStock = document.createElement("option");
    //������ ���������� �� ������ ���������
    for (var i = selectSource.options.length - 1; i >= 0; i--) {
        //�������� �������� ������ ���������
        var optionValue = parseInt(selectSource.options[i].value);
        //���� ��������� ������, ��� � �������� ��������� ����
        if (optionValue >= num) {
            //�������� �� ��������� ����� ��������
            selectSource.remove(i);
        }
        //���� ��������� ������, ��� � �������� ��������� ����
        else if (optionValue <= num) {
            //������ �������� �������� � �����
            optionSource.value = (num).toString();
            optionSource.text = (num).toString();
            //���������
            selectSource.append(optionSource);
        }
    }

    //������ ���������� �� ������ ������
    for (var j = selectStock.options.length - 1; j >= 0; j--) {
        //�������� �������� ������ �����
        var optionValues = parseInt(selectStock.options[j].value);
        //���� ��������� ������, ��� � �������� ��������� ����
        if (optionValues >= num) {
            //�������� �� ��������� ����� ��������
            selectStock.remove(j);
        }
        //���� ��������� ������, ��� � �������� ��������� ����
        else if (optionValues <= num) {
            //������ �������� �������� � �����
            optionStock.value = (num).toString();
            optionStock.text = (num).toString();
            //���������
            selectStock.append(optionStock);
        }
    }
}

//�������� �������
function generateMatrix(countVertices, source, stock) {

    //������� ������ � ��������� � ���� ���������� ���������
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

    //�������� �� id ������� � ������� ������� table ��� ���������� 
    const table = document.getElementById("matrix");
    const tbl = document.createElement('table');

    //�������� ������ ��������� � ����� �� ������� ���� ������   
    if (source > stock) {
        nums.splice(source - 1, 1);
        nums.splice(stock - 1, 1);
    }
    else {
        nums.splice(source - 1, 1);
        nums.splice(stock - 2, 1);
    }

    //��������� ��������� ��������
    for (let i = 0; i <= countVertices; i++) {
        const th = document.createElement('th');
        if (i == 0) {
            th.innerText = "";
        }
        else if (i == 1) {
            th.innerText = source;
        }
        else if (i == countVertices) {
            th.innerText = stock;
        }
        else {
            th.innerText = nums[i - 2];
        }

        th.style.textAlign = "center";
        tbl.appendChild(th);
    }

    //��������� ��������� �����
    for (let i = 0; i < countVertices; i++) {
        const tr = tbl.insertRow();
        const th = document.createElement('th');

        if (i == 0) {
            th.innerText = source;
        }
        else if (i == countVertices - 1) {
            th.innerText = stock;
        }
        else {
            th.innerText = nums[i - 1];

        }

        tr.appendChild(th);

        //���������� �������
        for (let j = 0; j < countVertices; j++) {
            //������� ������� input ��� �����
            const input = document.createElement("input");
            //������� ������ �������
            const td = document.createElement("td");
            //������ ��� � ����� ��� input
            if (i == 0) {
                if (j == 0) {
                    input.name = "matrix[" + source.toString() + "][" + source.toString() + "]";
                }
                else if (j == countVertices - 1) {
                    input.name = "matrix[" + source.toString() + "][" + stock.toString() + "]";
                }
                else {
                    input.name = "matrix[" + source.toString() + "][" + (nums[j - 1]).toString() + "]";
                }
            }
            else if (i == countVertices - 1) {
                if (j == 0) {
                    input.name = "matrix[" + stock + "][" + source + "]";
                }
                else if (j == countVertices - 1) {
                    input.name = "matrix[" + stock + "][" + stock + "]";
                }
                else {
                    input.name = "matrix[" + stock + "][" + (nums[j - 1]).toString() + "]";
                }
            }
            else {
                if (j == 0) {
                    input.name = "matrix[" + (nums[i - 1]).toString() + "][" + source + "]";
                }
                else if (j == countVertices - 1) {
                    input.name = "matrix[" + (nums[i - 1]).toString() + "][" + stock + "]";
                }
                else {
                    input.name = "matrix[" + (nums[i - 1]).toString() + "][" + (nums[j - 1]).toString() + "]";
                }
            }
            input.style.width = '45px';
            input.style.height = '40px';
            input.style.textAlign = "center";
            //������ 0 �� ��������� ������� � ������ �� ������ ��� ������
            if (i == j) {
                input.value = 0;
                input.setAttribute('readonly', 'readonly');
            }
            //���������� ����� input
            $(input).on('change keyup paste', function () {
                txt = $(this).val();
                //���� �������� � ��������� name
                name = $(this).attr("name");
                //����� ������� ��� ���������� �������� ������
                firstNumber = name.split("[")[1].substring(0, 1);
                secondNumber = name.split("[")[2].substring(0, 1);

                //���� ������ �����
                num = Number(txt)

                if (txt != '' && txt != num) {
                    //��� �� �������� ������ - �������
                    $(this).val('');
                }
                else if (txt == '') {
                    //���������� ��������
                    $("input[name=\"matrix[" + secondNumber + "][" + firstNumber + "]\"]").val('');
                }
                else {
                    //���������� 0
                    $("input[name=\"matrix[" + secondNumber + "][" + firstNumber + "]\"]").val(0);
                }
            });
            //��������� � ������ input
            td.appendChild(input);
            //��������� � ������ ������
            tr.appendChild(td);
        }
    }
    //���������� ������� 
    table.appendChild(tbl);
}