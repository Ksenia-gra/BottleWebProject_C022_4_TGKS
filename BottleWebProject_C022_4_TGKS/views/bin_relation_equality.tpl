% rebase('layout.tpl', title='��������� ���������������', year=year)

<div class="card p-4 shadow border border-black">
    <h3 class="card-title text-light">����������� ��������������� ��������� ���������</h3>
    <h3 class="card-title text-light">���������� ��������������� ��������� ���������</h3>
    <div class="card-body">
        <div class="alert alert-secondary d-flex align-items-center" role="alert">
            <i class="fa fa-info-circle fs-1 me-3" aria-hidden="true"></i>
                ������� �������� ���������� ������, ����� � ����������� ���� ������� �������� ������� ��������� �����
        </div>
        <h3 class="card-title text-center"><strong>������� ������</strong></h3>
    
        <form method="post" action="/bin_relation_transitivity" class="text-center">
            <label for="vertices" >������� ���������� ������:</label>
            <br><br>
            <button type="button" class="button p-1 bg-black" onclick="changeValue(-1)">�</button>
            <input type="number" name="vertices" id="vertices" min="2" max="10" value="2" readonly class="raz ">
            <button type="button"  class="button p-1 bg-black" onclick="changeValue(1)">+</button>
            <br><br>

            <label>������� ������� ���������:</label>
            <br>
            <table class="centerTable">
                <tbody id="matrix"></tbody>
            </table>
            <br>
            <input type="submit" class="btn btn-outline-dark mt-1" value="������ ������">
        </form>
        <div class="d-flex justify-content-center">
            <table class="table table-bordered text-center mt-3">
                <thead>
                    <tr>
                        <th class="text-white">#</th>
                        % for i in range(len(matrix)):
                            <th>{{i+1}}</th>
                        % end
                    </tr>
                </thead>
                <tbody>
                    % i = 0
                    % for row in matrix:
                        <tr>
                            <th scope="row">{{i+1}}</th>
                            % for cell in row:
                                <td>{{cell}}</td>
                            % end
                        </tr>
                        % i += 1
                    % end
                </tbody>
            </table>
        </div>
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
                $(input).addClass('form-check-input')
                $(input).val(1);
                input.name = "matrix[" + i + "][" + j + "]";
                input.type = "checkbox";
                input.style.width='50px';
                input.style.height='50px';

                td.appendChild(input);
                tr.appendChild(td);
            }
        tbody.appendChild(tr);
        }
    }

    $(document).ready(function(){
        createMatrix(2)
    });

    $(document).ready(function(){
        $('#matrix input').on('change keyup paste',function(){
            console.log($(this).val(1));
        })
    });
</script>
