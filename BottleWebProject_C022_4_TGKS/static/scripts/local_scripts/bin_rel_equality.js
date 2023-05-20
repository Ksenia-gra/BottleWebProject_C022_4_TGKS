// ���������� ������� ��������� ���������� ������
function changeValue(change) {
    // �������� ������� input � ������� ��� ID
    var input = document.getElementById("verticesT");
    // �������� ������� �������� �������� input
    var currentValue = parseInt(input.value);
    // ��������� ����� ��������
    var newValue = currentValue + change;
    // ���������, ��� ����� �������� ��������� � ���������� ��������� (min, max)
    if (newValue >= parseInt(input.min) && newValue <= parseInt(input.max)) {
        // c������ ����� �������
        input.value = newValue;
        document.getElementById("matrix").innerHTML = "";
        createMatrix(newValue);
    }
}

// ������� ��� �������� ������� ���������
function createMatrix(numVertices) {
    var tbody = document.getElementById("matrix");
    for (var i = 0; i < numVertices; i++) {
        var tr = document.createElement("tr");
        for (var j = 0; j < numVertices; j++) {
            var td = document.createElement("td");
            var input = document.createElement("input");
            $(input).addClass('form-check-input')
            $(input).val(1);
            input.name = "matrix[" + i + "][" + j + "]";
            input.type = "checkbox";
            input.style.width = '50px';
            input.style.height = '50px';

            td.appendChild(input);
            tr.appendChild(td);
        }
        tbody.appendChild(tr);
    }
}

$(document).ready(function () {
    createMatrix(2)
});

$(document).ready(function () {
    $('#matrix input').on('change keyup paste', function () {
        console.log($(this).val(1));
    })
});