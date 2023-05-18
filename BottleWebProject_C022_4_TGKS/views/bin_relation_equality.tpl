% rebase('layout.tpl', title='��������� ���������������', year=year)

<div class="card p-4 shadow-lg border border-dark title-card">

    <div class="card-body">

        <h3 class="card-title text-light">����������� ��������������� ��������� ���������</h3>
        <h3 class="card-title text-light">���������� ��������������� ��������� ���������</h3>
        <br>
        </div>
    </div>
</div>
<div class="card p-4 shadow">
    <div class="card-body">
        <h3 class="card-text"><strong>������� ������</strong></h3>

        <form method="post" action="/bin_relation_transitivity">
            <label for="vertices">������� ���������� ������:</label>
            <br><br>

            <button type="button" class="button p-2 bg-black" onclick="changeValue(-1)">�</button>
            <input type="number" name="vertices" id="vertices" min="2" max="10" value="2" readonly class="raz">
            <button type="button"  class="button p-2 bg-black" onclick="changeValue(1)">+</button>
            <br><br>

            <label>������� ������� ���������:</label>
                <br>
                    <table>
                        <tbody id="matrix"></tbody>
                    </table>
                <br>
                    <input type="submit" value="���������">
        </form>
        <table class="table table-bordered center">
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
        <h3 class="card-text" id="result"><strong></strong></h3>
        <h5 class="card-text"></h5>
    </div>
</div>


<script>

    // ���������� ������� ��������� ���������� ������
    function changeValue(change) {
        // �������� ������� input � ������� ��� ID
        var input = document.getElementById("vertices");
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
                input.type = "number";
                input.name = "matrix[" + i + "][" + j + "]";
                input.style.width='50px';
                $(input).val(1);
                $(input).add
                td.appendChild(input);
                tr.appendChild(td);
            }
        tbody.appendChild(tr);
        }
    }
</script>
