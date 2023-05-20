from bottle import route, request, template, datetime
import matplotlib.pyplot as plt
import networkx as nx
import logic.hamiltonian_cycles_logic as h

@route('/hamiltonian_cycle', method='POST')
def submit():
    num_vertices = int(request.forms.get('amountOfVertices'))
    G = nx.Graph()
    matrix = []
    for i in range(num_vertices):
        row = []
        for j in range(num_vertices):
            cell = request.forms.get('matrix[{}][{}]'.format(i, j))
            row.append(int(cell) if cell else 0)
        matrix.append(row)
    
    for i in range(num_vertices):
        G.add_node(i + 1)

    counterRow = 0
    counterCol = 0
    for row in matrix:
        for elem in row:
            if (elem == 1):
                G.add_edge(counterRow + 1, counterCol + 1)
            counterCol += 1
        counterCol = 0
        counterRow += 1

    options = {
        'node_color': 'white',     # color of node
        'node_size': 900,         # size of node
        'width': 1,              # line width of edges
        'edge_color':'black'        # edge color
    }

    # Рисуем граф
    nx.draw_circular(G, with_labels = True, **options)

    ax = plt.gca()
    ax.collections[0].set_edgecolor("#000000")

    plt.savefig('static/images/hamiltonian_graph.png') # Сохраняем граф в файл
    plt.clf()

    answer = h.hamCycle(matrix)

    # Обновляем страницу с таблицей, решением, графом
    return template('hamiltonian_cycle', matrix=matrix, year=datetime.now().year, graphPath='static/images/hamiltonian_graph.png', answer=answer)