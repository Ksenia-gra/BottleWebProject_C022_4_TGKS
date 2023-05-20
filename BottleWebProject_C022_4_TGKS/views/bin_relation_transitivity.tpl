% rebase('layout.tpl', title='Антитранзитивность бинарного отношения', year=year,str_assim_antit=str_assim_antit,rev_matr_str=rev_matr_str,vert=vert)
<div class="card p-4 shadow-lg border border-dark title-card">

<div class="card-body">

<h4 class="card-title text-light">Ассисиметричность и антитранзитивность.Нахождение обратного отношения</h4>
<br>
       
<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link  me-3 mt-1" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Ассиметричность графа</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link me-3 mt-1" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Антитранзитивность графа</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link me-3 mt-1" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Обратное бинарное отношение</button>
  </li>
</ul>
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show  nav-btn fs-5" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab"><strong>Ассиметричность</strong> это свойство, которое говорит, что если две вершины имеют отношение друг к другу, то обратное отношение между ними не может быть истиной.
               </div>
  <div class="tab-pane fade nav-btn fs-5" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab"><strong>Антитранзитивность </strong> - это свойство, которое говорит, что если одна вершина имеет отношение к другой вершине, а другая вершина имеет отношение к третьей вершине, то первая вершина не может иметь отношение к третьей 
                вершине.</div>
  <div class="tab-pane fade nav-btn fs-5" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab"><strong>Обратное бинарное отношение</strong> получается путем транспонирования исходной матрицы смежности.полных</strong></div>


 </div>
</div>
</div>

<div class="card p-4 shadow border border-black" >
<div class="card-body">
<div class="alert alert-secondary d-flex align-items-center " role="alert">
<i class="fa fa-info-circle fs-1 me-3" aria-hidden="true"></i>
  Сначала выберите количество вершин, потом в появившихся полях отмечайте существующие связи между вершинами в матрице смежности
</div>
    <h3 class="card-title text-center"><strong>Решение задачи</strong></h5>
    
<form method="post" action="/bin_relation_transitivity" class="text-center">

    <label for="vertices" >Введите количество вершин:</label>
    <br><br>

<button type="button" class="button p-1 bg-black text-center" onclick="changeValue(-1)">–</button>
<input type="number" name="vertices" id="vertices" min="2" max="10" value={{vert}} readonly class="raz ">
<button type="button"  class="button p-1 bg-black text-center" onclick="changeValue(1)">+</button>
<br><br>

<label>Введите матрицу смежности:</label>
<br>
<table class="centerTable">
<tbody id="matrix">
</tbody>
</table>
<br>
<div class="d-grid gap-2 col-3 mx-auto align-items-center">
<input type="submit" class="btn btn-dark mt-1" name="solveTask" value="Решить задачу">
<input type="submit" class="btn btn-dark mt-1" name="solveTaskGenerate" value="Сгенерировать матрицу и решить">
<input type="submit" class="btn btn-outline-dark mt-1" name="resetBtn" value="Сбросить матрицу">
</div>
</form>
<h3 class="mt-3 text-center"><strong>Результат решения:</strong></h3>
<p class=" text-center mt-3">{{str_assim_antit}}</p>
<h5 class="text-center mt-3">Исходная матрица смежности:</h5>
<div class="d-flex justify-content-center">
<table class="table table-bordered text-center mt-3">
    <thead>
   
    <tr>

     <th class="text-white"></th>

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
       %i += 1
% end
</tbody>
</table>
</div>
<h5 class="text-center mt-3">{{rev_matr_str}}</h5>
<div class="d-flex justify-content-center">
<table class="table table-bordered text-center mt-3">
    <thead>
   
    <tr>

     <th class="text-white"></th>

      % for i in range(len(rev_matrix)):
      <th>{{i+1}}</th>
       % end
    </tr>
  </thead>
    <tbody>
   
        % i = 0
        % for row in rev_matrix:
        <tr> 
        
            <th scope="row">{{i+1}}</th>
      
            % for cell in row:
            
        <td>{{cell}}</td>
            % end

        </tr>
       %i += 1
% end
</tbody>
</table>
</div>

</div>
</div>
<script src="/static/scripts/local_scripts/bin_rel_transitivity.js">

</script>
