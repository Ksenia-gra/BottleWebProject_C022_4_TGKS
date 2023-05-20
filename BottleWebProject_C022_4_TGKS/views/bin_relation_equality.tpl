% rebase('layout.tpl', title='Отношение эквивалентнс', year=year)

<div class="card p-4 mt-2 shadow border border-black">
    <h3 class="card-title">Определение эквивалентности бинарного отношения</h3>
    <h3 class="card-title">Нахождение дополнительного бинарного отношения</h3>
    <div class="card-body">
        <div class="alert alert-secondary d-flex align-items-center" role="alert">
            <i class="fa fa-info-circle fs-1 me-3" aria-hidden="true"></i>
                Сначала выберите количество вершин, потом в появившиеся поля вводите значения матрицы смежности графа
        </div>
        <h3 class="card-title text-center"><strong>Решение задачи</strong></h3>
    
        <form method="post" action="/bin_relation_equality" class="text-center">
            <label for="verticesT" >Введите количество вершин:</label>
            <br><br>
            <button type="button" class="button p-1 bg-black" onclick="changeValue(-1)">–</button>
            <input type="number" name="verticesT" id="verticesT" min="2" max="10" value="2" readonly class="raz">
            <button type="button"  class="button p-1 bg-black" onclick="changeValue(1)">+</button>
            <br><br>

            <label>Введите матрицу смежности:</label>
            <br>
            <table class="centerTable">
                <tbody id="matrix"></tbody>
            </table>
            <br>
            <input type="submit" class="btn btn-outline-dark mt-1" value="Решить задачу">
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

        <div class="alert alert-secondary d-flex align-items-center" role="alert">{{res}}</div>

        <div class="d-flex justify-content-center">
            <table class="table table-bordered text-center mt-3">
                <thead>
                    <tr>
                        <th class="text-white">#</th>
                        % for i in range(len(dopMatrix)):
                            <th>{{i+1}}</th>
                        % end
                    </tr>
                </thead>
                <tbody>
                    % i = 0
                    % for row in dopMatrix:
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

<script src="\static\scripts\local_scripts\bin_rel_equality.js"></script>