% rebase('layout.tpl', title='Максимальный поток',vertexCount=vertexCount,vertexSource=vertexSource, vertexStock= vertexStock, image=image,max_flow=max_flow, year=year)


<div class="card p-4 shadow-lg border border-dark bg-card-max">

<div class="card-body">
<h5 class="card-title text-light fs-1">Максимальный поток</h5>
<h5 class="card-title text-light fw-normal fs-5">Нахождение максимального потока в сети от источника к стоку</h5>
<br>
<button class="btn btn-link link-light fs-6 ps-0 p-0 " data-bs-toggle="collapse" id="readMoreBtn" data-bs-target="#collapseCard" aria-expanded="false">Метод решения</button>
<div class="collapse" id="collapseCard">
<p class="text-light">Описание решения: <br>
1.  Все потоки равны нулю. Остаточная сеть изначально совпадает с исходной сетью.<br>
2.  В остаточной сети находим кратчайший путь из источника в сток. Если такого пути нет, останавливаемся.<br>
3.  Пускаем через найденный путь (он называется увеличивающим путём или увеличивающей цепью) максимально возможный поток:<br>
&nbsp;&nbsp;&nbsp;&nbsp; a.  На найденном пути в остаточной сети ищем ребро с минимальной пропускной способностью.<br>
&nbsp;&nbsp;&nbsp;&nbsp; b.  Для каждого ребра на найденном пути увеличиваем поток на минимальное значение, а в противоположном ему — уменьшаем на <br>
&nbsp;&nbsp;&nbsp;&nbsp; минимальное значение.<br>
&nbsp;&nbsp;&nbsp;&nbsp; c.  Модифицируем остаточную сеть. Для всех рёбер на найденном пути, а также для противоположных им рёбер, вычисляем новую <br>
&nbsp;&nbsp;&nbsp;&nbsp; пропускную способность.<br>
&nbsp;&nbsp;&nbsp;&nbsp; Если она стала ненулевой, добавляем ребро к остаточной сети, а если обнулилась, стираем его.<br>
4.  Возвращаемся на шаг 2.
</p>
</div>
</div>
</div>

<div class="card shadow">
    <div class="card-body p-0 d-flex">
        <div class="col-5 p-4 pe-0 ps-0">
            <h3 class="card-title ps-4 text-center fs-3"><strong>Ввод данных</strong></h3>
           <br>
            <form method="POST" class="ps-4" action="/maximum_flow">
                <label class="fs-5">Количество вершин:</label>
                <br>
                <div class="input-group mb-3">
                    <button class="btn btn-outline-secondary bg-white rounded-0 text-dark" type="button" onclick="changeValue(-1, source[source.selectedIndex].value, stock[stock.selectedIndex].value);removeOptions();" id="button-addon1">&lt;</button>
                    <input type="text" style="text-align: center;" readonly name="vertex" id="vertex" size="5" value="2">
                    <button class="btn btn-outline-secondary bg-white rounded-0 text-dark" type="button" onclick="changeValue(1, source[source.selectedIndex].value, stock[stock.selectedIndex].value);removeOptions();" id="button-addon2">&gt;</button> 
                </div>
                <label class="fs-5">Вершина источника:</label>
                <select class="form-select" style="width:150px;" name="source" id="source" aria-label=".form-select-sm example" >
                    <option selected disabled hidden>Выберите...</option>
                    <option value ="1">1</option>
                    <option value ="2">2</option>
                </select>
                <div class="invalid-feedback">
                        Нельзя использовать одну и ту же вершину
                </div>
               <br>

                <label class="fs-5 text-center">Вершина стока:</label>
                <select class="form-select" id="stock" name="stock" style="width:150px;" aria-label=".form-select-sm example">
                    <option selected disabled hidden>Выберите...</option>
                    <option value ="1">1</option>
                    <option value ="2">2</option>
                </select>
                <div class="invalid-feedback">
                        Нельзя использовать одну и ту же вершину
                </div>
                <br>
                <div>
                    <label class="fs-5 ps-4">Заполнение пропускных способностей дуг:</label>
                    <br>
                        <div style="text-align: -webkit-center;">
                            <table class="mt-3 table-responsive">
                                <tbody id="matrix">
                                    %if matrix != []:
                                        %for row in matrix:
                                        <tr>
                                            %for i in matrix.get(row):
                                            <td class="text-center" style="width: 45px; height: 40px;" readonly>{{i}}</td>
                                            %end
                                        </tr>
                                        %end
                                    %end
                                </tbody>
                            </table>
                        </div>
                   <br>
                    <div class="border-top text-center border-dark border-2  pt-3">
                        <button type="submit" id="generateMatrix" name = "generateMatrix" class="fs-6 btn btn-light text-dark" style="border: groove; width:200px;">Генерация матрицы</button>   
                        <button type="submit" id="getValues" name = "getValues" class="fs-6 btn btn-light text-dark" style="border: groove; width:200px;">Граф</button>        
                    </div>
                </div>         
            </form>
            <br>
        </div>

        <div class="border-end border border-dark"></div>

        <div class="col p-4">
        <h3 class="card-title fs-3" style="text-align:center;"><strong>Результат решения</strong></h5>
             <p class="text-center">
                <img src="{{image}}">
             </p>
             %if vertexCount != 0:
                 <div id = 'result'>
                   <p class = 'fs-5'>Количество вершин: {{vertexCount}}</p>
                   <p class = 'fs-5'>Выбранная вершина источника: {{vertexSource}}</p>
                   <p class = 'fs-5'>Выбранная вершина стока: {{vertexStock}}</p>
                   <p class = 'fs-5'>Максимальный поток: {{max_flow}}</p>
                </div>
             %end
        </div>
    </div>
</div>
<script src="/static/scripts/local_scripts/max_flow.js"></script>

<script>

    $(document).ready(function() {
        $("#getValues").attr("disabled", "disabled")
    })

    $("#source").on('change keyup paste', function() 
    {
        source = $(this).val()
        stock = $("#stock").val()

        numSource = Number(source)
        numStock = Number(stock)

        if (source == numSource && stock == numStock && numStock == numSource)
        {
            $("#stock").addClass('is-invalid')
            $("#source").addClass('is-invalid')
            $("button[id=getValues]").attr("disabled", "disabled")
        }
        else if (source != numSource || stock != numStock)
        {
            $("button[id=getValues]").attr("disabled", "disabled")
        }
        else
        {
            $("#stock").removeClass('is-invalid')
            $("#source").removeClass('is-invalid')
            $("button[id=getValues]").removeAttr("disabled")
        }
    });

    $("#stock").on('change keyup paste', function() 
    {
        source = $("#source").val()
        stock = $(this).val()

        numSource = Number(source)
        numStock = Number(stock)

        if (source == numSource && stock == numStock && numStock == numSource)
        {
            $("#stock").addClass('is-invalid')
            $("#source").addClass('is-invalid')
            $("button[id=getValues]").attr("disabled", "disabled")
        }
        else if (source != numSource || stock != numStock)
        {
            $("button[id=getValues]").attr("disabled", "disabled")
        }
        else
        {
            $("#stock").removeClass('is-invalid')
            $("#source").removeClass('is-invalid')
            $("button[id=getValues]").removeAttr("disabled")
        }
    });
</script>