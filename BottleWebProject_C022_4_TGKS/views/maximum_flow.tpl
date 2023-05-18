% rebase('layout.tpl', title='Максимальный поток', year=year)

<div class="card p-4 shadow-lg border border-dark bg-card-max">

<div class="card-body">
<h5 class="card-title text-light fs-1">Максимальный поток</h5>
<h5 class="card-title text-light fw-normal fs-5">Нахождение максимального потока в сети от источника к стоку</h5>
<br>
<button class="btn btn-link link-light fs-6 ps-0 p-0 " data-bs-toggle="collapse" id="readMoreBtn" data-bs-target="#collapseCard" aria-expanded="false">Метод решения</button>
<div class="collapse" id="collapseCard">
<p class="text-light">Описание решения: <br>
1.	Все потоки равны нулю. Остаточная сеть изначально совпадает с исходной сетью.<br>
2.	В остаточной сети находим кратчайший путь из источника в сток. Если такого пути нет, останавливаемся.<br>
3.	Пускаем через найденный путь (он называется увеличивающим путём или увеличивающей цепью) максимально возможный поток:<br>
&nbsp;&nbsp;&nbsp;&nbsp a.	На найденном пути в остаточной сети ищем ребро с минимальной пропускной способностью.<br>
&nbsp;&nbsp;&nbsp;&nbsp b.	Для каждого ребра на найденном пути увеличиваем поток на минимальное значение, а в противоположном ему — уменьшаем на <br>
&nbsp;&nbsp;&nbsp;&nbsp минимальное значение.<br>
&nbsp;&nbsp;&nbsp;&nbsp c.	Модифицируем остаточную сеть. Для всех рёбер на найденном пути, а также для противоположных им рёбер, вычисляем новую <br>
&nbsp;&nbsp;&nbsp;&nbsp пропускную способность.<br>
&nbsp;&nbsp;&nbsp;&nbsp Если она стала ненулевой, добавляем ребро к остаточной сети, а если обнулилась, стираем его.<br>
4.	Возвращаемся на шаг 2.
</p>
</div>
</div>
</div>

<div class="card shadow">
    <div class="card-body p-0 d-flex">
        <div class="col p-5 pe-0" style="margin-right: -400px;">
            <h3 class="card-title fs-3"><strong>Ввод данных</strong></h5>
            <br>
            <form method="post" action="/maximum_flow">
                <label class="fs-5" for="vertices">Количество вершин:</label>
                <br>
                <div class="input-group mb-3">
                    <button class="btn btn-outline-secondary bg-white rounded-0 text-dark" type="button" id="button-addon1"><</button>
                    <input style="text-align:center;" readonly type="text" size="5" min="0" max="10" placeholder="0" >
                    <button class="btn btn-outline-secondary bg-white rounded-0 text-dark" type="button" id="button-addon1">></button>
                </div>
                <label class="fs-5">Вершина источника:</label>
               <select class="form-select w-25" aria-label=".form-select-sm example" >
               <option selected>Выберите..</option>
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                </select>
                <br>

                <label class="fs-5">Вершина стока:</label>
                    <select class="form-select w-25" aria-label=".form-select-sm example" >
                    <option selected>Выберите..</option>
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                </select>
               
            </form>
             <br>

            <form method="post" action="/maximum_flow">
                <label class="fs-5">Пропускные способности дуг:</label>
                <div class="border-bottom border border-dark" style="margin-right: 400px;"></div>
                <br>
                <table>
                    <tbody id="matrix"></tbody>
                </table>
                <br>
                <a class="fs-6 btn btn-light text-dark" style="border: groove; width:100px;" role="button" data-bs-toggle="button">Матрица</a>
                <a class="fs-6 btn btn-light text-dark" style="border: groove; width:100px;" role="button" data-bs-toggle="button">Граф</a>
            </form>
        </div>

        <div class="border-end border border-dark"></div>

        <div class="col p-5">
        <h3 class="card-title fs-3" style="text-align:center;"><strong>Результат решения</strong></h5>
            <table class="table">
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
        </div>
</div>
</div>



