window.addEventListener('load', () => {
    changeValue(0, 1, 2);
});

const inputVertex = document.getElementById("vertex");
const selectSource = document.getElementById("source");
const selectStock = document.getElementById("stock");

selectSource.addEventListener("change", (event) => {
    document.getElementById("matrix").innerHTML = "";
    var source = selectSource.options[selectSource.selectedIndex].value;
    if (source != Number(source)) {
        source = 1;
    }

    var stock = selectStock.options[selectStock.selectedIndex].value;
    if (stock != Number(stock)) {
        stock = inputVertex.value;
    }

    generateMatrix(parseInt(inputVertex.value), parseInt(source), parseInt(stock))
});

selectStock.addEventListener("change", (event) => {
    document.getElementById("matrix").innerHTML = "";
    var source = selectSource.options[selectSource.selectedIndex].value;
    if (source != Number(source)) {
        source = 1;
    }

    var stock = selectStock.options[selectStock.selectedIndex].value;
    if (stock != Number(stock)) {
        stock = inputVertex.value;
    }

    generateMatrix(parseInt(inputVertex.value), parseInt(source), parseInt(stock))
});

// ���������� ������� ��������� ���������� ������
function changeValue(change, source, stock) {
    // �������� ������� �������� �������� input
    var num = parseInt(inputVertex.value);
    // ��������� ����� ��������
    var newValue = num + change;
    // c������ ����� �������
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
    var nums = []
    for (var i = 1; i <= countVertices; i++) {
        nums.push(i);
    }

    const table = document.getElementById("matrix");
    const tbl = document.createElement('table');
    // ��������� ��������� ��������
    for (let i = 0; i <= countVertices; i++) {
        const th = document.createElement('th');
        th.innerText = i ;
        th.style.textAlign = "center";
        if (i == 0) {
            th.innerText = "";
        }
        tbl.appendChild(th);
    }

    var thFirst = document.createElement('th');
    thFirst.innerText = source;

    var thLast = document.createElement('th');
    thLast.innerText = stock;

    nums.splice(source - 1, 1);
    nums.splice(stock - 1, 1);

    console.log(nums);

    for (let i = 0; i < countVertices; i++) {
        const tr = tbl.insertRow();

        if (i == 0) {
            tr.appendChild(thFirst);
        }
        else if (i == countVertices - 1) {
            tr.appendChild(thLast);
        }
        else {
            const th = document.createElement('th');
            th.innerText = nums[i - 1];
            tr.appendChild(th);
        }
        
        for (let j = 0; j < countVertices; j++) {
            const input = document.createElement("input");
            const td = document.createElement("td");
            input.name = "matrix[" + i + "][" + j + "]";
            input.style.width = '45px';
            input.style.height = '40px';
            input.style.textAlign = "center";
            if (i == j) {
                input.value = 0;
                input.setAttribute('readonly', 'readonly');
            }
            $(input).on('change keyup paste', function () {
                txt = $(this).val()
                num = Number(txt)

                if (txt != '' && txt != num) {
                    $(this).val('');
                }
                else {
                    $("input[name=matrix[" + j.toString() + "][" + i.toString() + "]]").val(txt);
                }
            });
            td.appendChild(input);
            tr.appendChild(td);
        }
    }
    table.appendChild(tbl);
}