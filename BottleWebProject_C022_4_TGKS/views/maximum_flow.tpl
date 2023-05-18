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
        <div class="col-5 p-4 pe-0 ps-0">
            <h3 class="card-title ps-4 text-center fs-3"><strong>Ввод данных</strong></h5>
            <br>
            <form method="post" class="ps-4" action="/maximum_flow">
                <label class="fs-5">Количество вершин:</label>
                <br>
                <div class="input-group mb-3">
                    <button class="btn btn-outline-secondary bg-white rounded-0 text-dark" type="button" onclick="changeValue(-1);removeOptions();" id="button-addon1"><</button>
                    <input type="number" style="text-align:center;" readonly name="vertex" id="vertex" size="5" min="2" max="10" value="2" >
                    <button class="btn btn-outline-secondary bg-white rounded-0 text-dark" type="button" onclick="changeValue(1);removeOptions();" id="button-addon1">></button>
                </div>
                <label class="fs-5">Вершина источника:</label>

               <select class="form-select" style="width:150px;" name="source" id="source" aria-label=".form-select-sm example" >
                    <option selected="true" disabled="disabled">Выберите...</option>
                    <option value ="1">1</option>
                    <option value ="2">2</option>
                    <option value ="3">3</option>
                    <option value ="4">4</option>
                    <option value ="5">5</option>
                    <option value ="6">6</option>
                    <option value ="7">7</option>
                    <option value ="8">8</option>
                    <option value ="9">9</option>
                    <option value ="10">10</option>
                </select>
                <br>

                <label class="fs-5" style="text-align-center">Вершина стока:</label>

                    <select class="form-select" id="stock" name="stock" style="width:150px;" aria-label=".form-select-sm example" >
                    <option selected="true" disabled="disabled">Выберите...</option>
                    <option value ="1">1</option>
                    <option value ="2">2</option>
                    <option value ="3">3</option>
                    <option value ="4">4</option>
                    <option value ="5">5</option>
                    <option value ="6">6</option>
                    <option value ="7">7</option>
                    <option value ="8">8</option>
                    <option value ="9">9</option>
                    <option value ="10">10</option>
                </select>
            </form>
             <br>

            <form method="post" action="/maximum_flow">
                <label class="fs-5 ps-4">Заполнение пропускных способностей дуг:</label>
               
                <br>
                <table class="ps-4">
                    <tbody id="matrix"></tbody>
                </table>
                <br>
                 <div class="border-top text-center border-dark border-3  pt-3">
                    <a class="fs-6 ms-4 btn btn-light text-dark" style="border: groove; width:100px;" role="button" data-bs-toggle="button">Матрица</a>
                    <a class="fs-6 btn btn-light text-dark" style="border: groove; width:100px;" role="button" data-bs-toggle="button">Граф</a>           
                 </div>
            </form>
        </div>

        <div class="border-end border border-dark"></div>

        <div class="col p-4">
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
<script src="/static/scripts/local_scripts/max_value.js">

</script>
