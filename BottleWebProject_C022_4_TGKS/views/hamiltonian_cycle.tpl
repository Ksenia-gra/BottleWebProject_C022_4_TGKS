% rebase('layout.tpl', title="Гамильтоновы циклы", year=year)

<div class="card p-4 shadow-lg border border-dark title-card-ham">
	<div class="card-body">
		<h1 class="card-title fw-bold text-light">Гамильтоновы циклы</h1>
		<h5 class="card-title fw-normal text-light ">Нахождение гамильтоновых циклов в неориентированном графе</h5>
		
		</br>
		
		<button class="btn bg-white" 
				data-bs-toggle="collapse" 
				id="readMoreBtn" 
				data-bs-target="#collapseCard" 
				aria-expanded="false">Теоретическая сводка</button>

		<div class="collapse mt-2" id="collapseCard">
			<p class="text-light lh-1 fs-6">
				</br>
				Цикл (цепь) в графе G называется <strong>Гамильтоновым</strong>, если он проходит через каждую вершину графа G ровно один раз.
                </br>
                </br>
                Граф G называется <strong>полным</strong>, если каждая его вершина является смежной со всеми остальными вершинами. В полном графе <strong>всегда существуют</strong> гамильтоновы циклы.
                </br>
                </br>
                Также <strong>необходимым условием</strong> существования гамильтонова цикла является связность графа.
            	</br>
            	</br>
            </p>
            <p class="text-light fw-bold lh-1 fs-5 text-center">
            	Пример вычисления Гамильтоновых циклов на основе рекурсивного алгоритма обратной трассировки:
            </p>
            <p class="text-light lh-base fs-6">
            	<ol class="text-light">
            		<li>
            			Начало поиска цикла осуществляется запуском рекурсивной функции с значением позиции 1 (следующая после начальной вершины).
            		</li>
            		<li>
            			Если переданная позиция равняется длине пути (то есть все вершины уже включены в путь), то проверяется наличие ребра между начальной и конечной вершинами. Если такое ребро имеется, значит был найден Гамильтонов цикл, последовательность вершин выводится, флаг о наличии цикла в графе изменяется, и функция завершается.
            		</li>
            		<li>
            			Если еще не все вершины включены в путь, то идет перебор всех вершин с целью нахождения следующей подходящей вершины: она должна быть смежной с предыдущей добавленной вершиной, и не быть добавленной в путь до этого.
            		</li>
            		<li>
            			При нахождении подходящей вершины она добавляется в путь, отмечается как «посещённая», и происходит рекурсивный запуск этой функции с инкрементом позиции.
            		</li>
            		<li>
            			При завершении выполнения функции удаляется последняя вершина из пути, убирается отметка о посещении этой вершины и обрабатываются другие вершины.
            		</li>
            		<li>
            			После выполнения рекурсивной функции, если флаг не был изменен в процессе выполнения, тогда происходит вывод сообщения о том, что Гамильтоновы циклы отсутствуют в данном графе.
            		</li>
            	</ol>
			</p>
		</div>
	</div>
</div>

<div class="row">	
	<div class="col">
		<div class="card p-4 shadow" id="cardOne">
			<div class="card-body">
		    	<h3 class="card-header text-center pt-0 mb-2"><strong>Исходные данные</strong></h3>

				<form method="post" id="form" action="/hamiltonian_cycle" novalidate>
					<label for="vertices" class="fs-5 form-label">Введите количество вершин:</label>
					
					<input type="text" name="vertices" class="form-control" id="vertices" min="0" max="10" value="0">
					<div class="invalid-feedback">
				    	Введите число вершин от 2 до 10
				    </div>

					</br>
					
					<label id="fillMatrix" class="fs-5 d-none">Заполните матрицу смежности:</label>
					
					<table>
						<tbody id="matrix"></tbody>
					</table>		
						
					</br>
						
					<input type="submit" class="btn btn-dark" value="Отправить">
				</form>
			</div>
		</div>
	</div>

	<div class="col">
		<div class="card p-4 shadow" id="cardTwo">
			<div class="card-body">
				<h3 class="card-header text-center pt-0 mb-2"><strong>Решение</strong></h3>
				<table class="table">
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

</div>

<script>	
	$("#vertices").on('change keyup paste', function() {
		txt = $(this).val()
		num = Number(txt)

		if (txt != '' && txt != num || num < 2 || num > 10)
		{
			$(this).addClass('is-invalid')
			$("#fillMatrix").addClass('d-none')
			$("#matrix").addClass('d-none')
			$("input[type=submit]").attr("disabled", "disabled")
		}
		else 
		{
			$(this).removeClass('is-invalid')
			$("#fillMatrix").removeClass('d-none')	
			$("#matrix").removeClass('d-none')
			$("input[type=submit]").removeAttr("disabled")
			if (txt != '')
			{
				changeValue(num)
			}
		}
	});

</script>