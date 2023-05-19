// ���������� ������� ��������� ���������� ������
function changeValue(change) {
    // �������� ������� input � ������� ��� ID
    var inputVertex = document.getElementById("vertex");
    // �������� ������� �������� �������� input
    var num = parseInt(inputVertex.value);
    // ��������� ����� ��������
    var newValue = num + change;

    // c������ ����� �������
    inputVertex.value = newValue;
    document.getElementById("matrix").innerHTML = "";
    generateMatrix(newValue);
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
