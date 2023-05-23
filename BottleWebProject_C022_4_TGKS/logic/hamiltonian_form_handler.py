from bottle import route, request, template, datetime
import matplotlib.pyplot as plt
import networkx as nx
import logic.hamiltonian_cycles_logic as h
import random as rand
from datetime import datetime as dt

@route('/hamiltonian_cycle', method='POST')
def submit():
    if 'getRand' in request.forms:
        num_vertices = rand.randint(3, 7)
        G = nx.Graph()
        matrix = []
        for i in range(num_vertices):
            row = []
            for j in range(num_vertices):
                row.append(0)
            matrix.append(row)
    
        for i in range(len(matrix)):
            for j in range(len(matrix)):
                if (i == j):
                    matrix[i][j] = 0
                else:
                    matrix[i][j] = rand.randint(0, 1)

        for i in range(len(matrix)):
            for j in range(len(matrix)):
                if (matrix[i][j] == 1):
                    matrix[j][i] = 1
                else:
                    matrix[j][i] = 0

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
        
        answer = h.getHamCycles(matrix)
    
        counter = 1
        f=open("log_files\hamiltonian_log.txt",'a')
        f.write("----------------------------------------------------------------------------\n")
        f.write("Матрица смежности:\n")
        for i in matrix:
            f.write("{0}\n".format(i))
        f.write("\n")
        if answer != ["В данном графе нет Гамильтоновых циклов!"]:
            for i in answer:
                f.write("Цикл {0}: {1}\n".format(counter, ' '.join([str(elem) for elem in i])))
                counter += 1
            f.write("Дата и время: {0}\n\n".format(dt.now()))
        else:
            f.write("В данном графе нет Гамильтоновых циклов!\nДата и время: {0}\n\n".format(dt.now()))
        f.close()

        # Обновляем страницу с таблицей, решением, графом
        return template('hamiltonian_cycle', matrix=matrix, year=datetime.now().year, graphPath='static/images/hamiltonian_graph.png', answer=answer)
    else:
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
    
        answer = h.getHamCycles(matrix)

        counter = 1
        f=open("log_files\hamiltonian_log.txt",'a')
        f.write("----------------------------------------------------------------------------\n")
        f.write("Матрица смежности:\n")
        for i in matrix:
            f.write("{0}\n".format(i))
        f.write("\n")
        if answer != ["В данном графе нет Гамильтоновых циклов!"]:
            for i in answer:
                f.write("Цикл {0}: {1}\n".format(counter, ' '.join([str(elem) for elem in i])))
                counter += 1
            f.write("Дата и время: {0}\n\n".format(dt.now()))
        else:
            f.write("В данном графе нет Гамильтоновых циклов!\nДата и время: {0}\n\n".format(dt.now()))
        f.close()

        # Обновляем страницу с таблицей, решением, графом
        return template('hamiltonian_cycle', matrix=matrix, year=datetime.now().year, graphPath='static/images/hamiltonian_graph.png', answer=answer)