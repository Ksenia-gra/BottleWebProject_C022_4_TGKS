% rebase('layout.tpl', title="Гамильтоновы циклы", year=year, graphPath=graphPath, answer=answer)

<div class="card p-4 shadow-lg border border-dark title-card-ham">
	<div class="card-body">
		<h1 class="card-title fw-bold text-light">Гамильтоновы циклы</h1>
		<h5 class="card-title fw-normal text-light ">Нахождение гамильтоновых циклов в неориентированном графе</h5>
		
		</br>
		
		<button class="btn bg-white" 
				data-bs-toggle="collapse" 
				id="readTheoryBtn" 
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
					<label for="amountOfVertices" class="fs-5 form-label">Введите количество вершин:</label>
					
					<input type="text" name="amountOfVertices" class="form-control" id="amountOfVertices" min="0" max="10" value="">
					<div class="invalid-feedback">
				    	Введите число вершин от 2 до 10
				    </div>

					</br>
					
					<h3 id="fillMatrix" class="fs-4 fw-normal d-none mb-2 text-center">Заполните матрицу смежности</h3>
					
					<table id="matrixTable" class="table-sm d-none table text-center table-borderless">
						<tbody id="matrix"></tbody>
						<caption id="matrixCaption" class="text-center">0 при отсутствии связи, 1 при наличии связи</caption>
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
				<table class="table table-bordered table-sm" id="filledMatrix">
				  	<tbody>
				        % for row in matrix:
				        <tr>
				      	  	% for cell in row:
				        	<td class="text-center">{{cell}}</td>
				        	% end
				        </tr>
						% end
					</tbody>
				</table>
				<div class="text-center" id="answers">
					%counter = 1
					%for i in answer:
						<p class="fs-5">{{counter}} цикл: {{i}}</p>
						%counter += 1
					%end
				</div>
			</div>
		</div>	
	</div>
</div>

<div class="row mt-4">
	<div class="col">
		<div class="card shadow" id="cardThree">
			<div class="card-body text-center p-4">
				<h3 class="card-header text-center pt-0 mb-2"><strong>Граф</strong></h3>
				<img src="{{graphPath}}" class="p-4" id="graph">
			</div>
		</div>	
	</div>
</div>

<script>
	window.addEventListener('beforeunload', () => { 
		$("#answers").empty()
    	$("#fillMatrix").addClass('d-none')
    	$("#filledMatrix").empty()
    	$("#matrixTable").empty()
    	$("#graph").empty()
    	$("input[type=submit]").attr("disabled", "disabled")
	});

	window.addEventListener('unload', () => { 
		$("#answers").empty()
    	$("#fillMatrix").addClass('d-none')
    	$("#filledMatrix").addClass('d-none')
    	$("#matrixTable").addClass('d-none')
    	$("input[type=submit]").attr("disabled", "disabled")
	});

	$(document).ready(function() {
        const readTheory = "Теоретическая сводка" 
        $("#readTheoryBtn").click(function(){
            $(this).text($(this).text() == readTheory ? "Свернуть" : readTheory)
        });
    })

	$("#amountOfVertices").on('change keyup paste', function() 
	{
		txt = $(this).val()
		num = Number(txt)

		$("#answers").empty()

		if (txt != '' && txt != num || num < 2 || num > 10)
		{
			$(this).addClass('is-invalid')
			$("#fillMatrix").addClass('d-none')
			$("#filledMatrix").addClass('d-none')
			$("#matrixTable").addClass('d-none')
			$("input[type=submit]").attr("disabled", "disabled")
		}
		else 
		{
			$(this).removeClass('is-invalid')
			$("#fillMatrix").removeClass('d-none')
			$("#filledMatrix").addClass('d-none')
			$("#matrixTable").removeClass('d-none')
			$("input[type=submit]").removeAttr("disabled")
			changeVerticesNum(num)
		}
	});

</script>