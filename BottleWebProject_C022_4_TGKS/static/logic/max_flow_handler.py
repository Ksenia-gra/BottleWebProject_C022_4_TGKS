from bottle import route, request, template,datetime
import matplotlib.pyplot as plt
import networkx as nx

@route('/maximum_flow', method='POST')
def submit():
    #Cоздаем граф 
    G = nx.DiGraph(directed=True)
    #Получаем доступ к количеству вершинам 
    vertexCount = int(request.forms.get('vertex'))
    vertexStock = int(request.forms.get('stock'))
    vertexSource = int(request.forms.get('source'))
    matrix = []
    #Циклом проходимся по строкам и столбцам
    for i in range(vertexCount):
        row = []
        for j in range(vertexCount):
            #Получаем доступ к матрице 
            cell = request.forms.get('matrix[{}][{}]'.format(i, j))
            # Добавляем значение ячейки в row
            row.append(int(cell) if cell else 0)
        # Добавляем значения с ячеек в массив 
        matrix.append(row)

    # Добавляем узлы 
    for i in range(vertexCount):
        G.add_node(i+1)

    counterRow = 0
    counterCol = 0
    for row in matrix:
        for elem in row:
            if (elem != 0 and elem != ''):
                G.add_edge(counterRow + 1, counterCol + 1,capacity = elem)
            counterCol += 1
        counterCol = 0
        counterRow += 1
  
    max_flow = nx.maximum_flow(G,vertexSource,vertexStock, flow_func=nx.algorithms.flow.edmonds_karp)[0]
    # Циклом проходимся по массиву
    #for rows in matrix:
       # for elements in rows: 
            # G.add_edge(rows,elements)
             #Запускаем алгоритм Эдмонда-Карпа

    # Вид графа
    options = {
        'node_color': 'white',      # цвет узла
        'node_size': 850,           # размер узла
        'width': 1,                 # ширина ребер
        'arrowstyle': '-|>',        # стрелка у ребер
        'arrowsize': 16,            # размер текста в узлах
        'edge_color':'grey',        # цвет ребер
    }

    # Располагает вершины графа на круговой плоскости с равными угловыми интервалами между ними
    pos = nx.circular_layout(G)

    # Рисуем граф
    nx.draw(G, pos, with_labels = True, arrows=True, **options)

    # Вырисовка ребер
    #nx.draw_networkx_edge_labels(
    #G, 
    #pos,
    #edge_labels={
    #    (1,2): '5', 
    #    (2,3): '6',
    #    (3,1): '10'
    #},
    #font_color='black',font_size=12)
    
    # Вырисовываем обводку для каждого узла
    ax = plt.gca()
    ax.collections[0].set_edgecolor("#000000")

    # Сохраняем граф в файл
    plt.savefig('static/images/graph.png')
    # Стираем граф
    plt.clf()
    # Отображаем на странице граф и полученный ответ
    return template('maximum_flow', image='static/images/graph.png',max_flow=max_flow, year=datetime.now().year)