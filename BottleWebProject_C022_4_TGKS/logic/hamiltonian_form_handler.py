from bottle import route, request, template, datetime
import random
import matplotlib.pyplot as plt
import networkx as nx
import logic.hamiltonian_cycles_logic as h

@route('/hamiltonian_cycle', method='POST')
def submit():
    # Получаем результат ввода в input 
    num_vertices = int(request.forms.get('amountOfVertices'))
    # Функция для работы с графом
    G = nx.Graph()
    # Проходимся циклом по заполненной матрицы и добавляем значения в массив
    matrix = []
    for i in range(num_vertices):
        row = []
        for j in range(num_vertices):
            cell = request.forms.get('matrix[{}][{}]'.format(i, j))
            row.append(int(cell) if cell else 0)
        matrix.append(row)

    # Добавляем кол-во вершин
    for i in range(num_vertices):
        G.add_node(i + 1)

    # Добавляем ребра 
    counterRow = 0
    counterCol = 0
    for row in matrix:
        for elem in row:
            if (elem == 1):
                G.add_edge(counterRow + 1, counterCol + 1)
            counterCol += 1
        counterCol = 0
        counterRow += 1

    # Вид графа
    options = {
        'node_color': 'white', # цвет вершин    
        'node_size': 900,  # размер вершин
        'width': 1, # ширина ребер
        'edge_color':'black' # цвет ребер
    }

    # Рисуем граф
    nx.draw_circular(G, with_labels = True, **options)

    # Добавляем обводку для вершин
    ax = plt.gca()
    ax.collections[0].set_edgecolor("#000000")

    # Сохраняем граф в файл
    plt.savefig('static/images/hamiltonian_graph.png') 
    plt.clf()

    # Вызов функции с логикой для решения 
    answer = h.hamCycle(matrix)
    
    if 'graph' in request.forms:
         # Обновляем страницу с таблицей, решением, графом
        return template('hamiltonian_cycle', matrix=matrix, year=datetime.now().year, graphPath='static/images/hamiltonian_graph.png', answer=answer)
    elif 'genMat' in request.forms:
         matrix = []
         for i in range(n):
            row = []
         for j in range(m):
            row.append(random.randint(0, 9)) # случайное число от 0 до 9
         matrix.append(row)
         return template('hamiltonian_cycle', matrix=matrix, year=datetime.now().year, graphPath='static/images/hamiltonian_graph.png', answer=answer)
 