from bottle import route, request, template, datetime
import matplotlib.pyplot as plt
import networkx as nx
import random as r
import logic.max_flow_logic as mfl
from datetime import datetime as dt

@route('/maximum_flow', method="POST")
def getValue():
    if 'getValues' in request.forms:
        # Получаем доступ к количеству вершинам 
        vertexSource = int(request.forms.get('source'))
        vertexCount = int(request.forms.get('vertex'))
        vertexStock = int(request.forms.get('stock'))

        # Нумерация между источником и стоком
        nums = []
        for i in range(vertexCount):
            nums.append(i + 1)

        # Удаление вершин источника и стока из массива всех вершин   
        nums.remove(vertexSource)
        nums.remove(vertexStock)

        rows = {}
        # Циклом проходимся по строкам и столбцам
        for i in range(1, vertexCount + 1):
            if (i == 1):
                rows[vertexSource] = []
            elif (i == vertexCount):
                rows[vertexStock] = []
            else:
                rows[nums[i - 2]] = []
            for j in range(0, vertexCount):
                # Получаем доступ к матрице 
                if (i == 1):
                    if (j == vertexCount - 1):
                        cell = request.forms.get('matrix[{}][{}]'.format(vertexSource, vertexStock))
                        rows[vertexSource].append(int(cell) if cell else 0)
                    elif (j == 0):
                        cell = request.forms.get('matrix[{}][{}]'.format(vertexSource, vertexSource))
                        rows[vertexSource].append(int(cell) if cell else 0)
                    else:
                        cell = request.forms.get('matrix[{}][{}]'.format(vertexSource, nums[j - 1]))
                        rows[vertexSource].append(int(cell) if cell else 0)
                elif (i == vertexCount):
                    if (j == 0):
                        cell = request.forms.get('matrix[{}][{}]'.format(vertexStock, vertexSource))
                        rows[vertexStock].append(int(cell) if cell else 0)
                    elif (j == vertexCount - 1):
                        cell = request.forms.get('matrix[{}][{}]'.format(vertexStock, vertexStock))
                        rows[vertexStock].append(int(cell) if cell else 0)
                    else:
                        cell = request.forms.get('matrix[{}][{}]'.format(vertexStock, nums[j - 1]))
                        rows[vertexStock].append(int(cell) if cell else 0)
                else:
                    if (j == 0):
                        cell = request.forms.get('matrix[{}][{}]'.format(nums[i - 2], vertexSource))
                        rows[nums[i - 2]].append(int(cell) if cell else 0)
                    elif (j == vertexCount - 1):
                        cell = request.forms.get('matrix[{}][{}]'.format(nums[i - 2], vertexStock))
                        rows[nums[i - 2]].append(int(cell) if cell else 0)
                    else:
                        cell = request.forms.get('matrix[{}][{}]'.format(nums[i - 2], nums[j - 1]))
                        rows[nums[i - 2]].append(int(cell) if cell else 0)

        max_flow, G = mfl.findMaxFlow(vertexCount, vertexSource, vertexStock, rows)

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

        # Добавляем вес на ребра графика
        edges_labels={}

        for u, v in G.edges():
            edges_labels[(u,v)] = G[u][v]['capacity']
        # Вырисовка ребер
        nx.draw_networkx_edge_labels(
        G, 
        pos,
        edge_labels=edges_labels,
        font_color='black',font_size=12)
    
        # Вырисовываем обводку для каждого узла
        ax = plt.gca()
        ax.collections[0].set_edgecolor("#000000")

        # Сохраняем граф в файл
        plt.savefig('static/images/graph.png')
        # Стираем граф
        plt.clf()

        f=open("log_files\max_flow_logs.txt",'a')
        f.write("---------------------------------------------------------------------------------------------------------\n")
        f.write("Матрица пропускных дуг:\n")
        for i in rows:
            f.write("{0}\n".format(rows.get(i)))
        f.write("\n")
        f.write("Всего вершин: {0}\n".format(vertexCount))
        f.write("Вершина источника: {0}\n".format(vertexSource))
        f.write("Вершина стока: {0}\n".format(vertexStock))
        f.write("Максимальный поток: {0}\n".format(max_flow))
        f.write("Дата и время: {0}\n\n".format(dt.now()))
        f.close()

        return template('maximum_flow', vertexCount=vertexCount, matrix=rows, vertexSource=vertexSource, vertexStock=vertexStock, image='static/images/graph.png', max_flow=max_flow, year=datetime.now().year)
    
    elif 'generateMatrix' in request.forms:
        num_vertices = r.randint(3, 6)
        vertexSource = r.randint(1, num_vertices)
        vertexStock = r.randint(1, num_vertices)
        while vertexSource == vertexStock:
            vertexStock = r.randint(1, num_vertices)

        nums = []
        for i in range(num_vertices):
            nums.append(i + 1)

        # Удаление вершин источника и стока из массива всех вершин   
        nums.remove(vertexSource)
        nums.remove(vertexStock)

        rows = {}
    
        # Циклом проходимся по строкам и столбцам
        for i in range(1, num_vertices + 1):
            if (i == 1):
                rows[vertexSource] = []
            elif (i == num_vertices):
                rows[vertexStock] = []
            else:
                rows[nums[i - 2]] = []
            for j in range(num_vertices):
                # Получаем доступ к матрице 
                if (i == 1):
                    if (j == num_vertices - 1):
                        rows[vertexSource].append(0)
                    elif (j == 0):
                        rows[vertexSource].append(0)
                    else:
                        rows[vertexSource].append(0)
                elif (i == num_vertices):
                    if (j == 0):
                        rows[vertexStock].append(0)
                    elif (j == num_vertices - 1):
                        rows[vertexStock].append(0)
                    else:
                        rows[vertexStock].append(0)
                else:
                    if (j == 0):
                        rows[nums[i - 2]].append(0)
                    elif (j == num_vertices - 1):
                        rows[nums[i - 2]].append(0)
                    else:
                        rows[nums[i - 2]].append(0)

        cols = []

        # Нумерация колонок 
        for i in rows:
            cols.append(i)
           
        for i in rows:
            for col in cols:
                if (i == col):
                    rows[i][cols.index(col)] = 0
                elif (rows[i][cols.index(col)] == 0):
                    rows[i][cols.index(col)] = r.randint(2, 100)

        for i in rows:
            for col in cols:
                random = r.randint(1, 2)
                if (random == 1 and rows[col][cols.index(i)] != 0):
                    rows[i][cols.index(col)] = 0
                elif (random == 2 and rows[i][cols.index(col)] != 0):
                    rows[col][cols.index(i)] = 0

        max_flow, G = mfl.findMaxFlow(num_vertices, vertexSource, vertexStock, rows)

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

        # Добавляем вес на ребра графика
        edges_labels={}

        for u, v in G.edges():
            edges_labels[(u,v)] = G[u][v]['capacity']

        # Вырисовка ребер
        nx.draw_networkx_edge_labels(
        G, 
        pos,
        edge_labels=edges_labels,
        font_color='black',font_size=12)
    
        # Вырисовываем обводку для каждого узла
        ax = plt.gca()
        ax.collections[0].set_edgecolor("#000000")

        # Сохраняем граф в файл
        plt.savefig('static/images/graph.png')
        # Стираем граф
        plt.clf()

        f=open("log_files\max_flow_logs.txt",'a')
        f.write("---------------------------------------------------------------------------------------------------------\n")
        f.write("Матрица пропускных дуг:\n")
        for i in rows:
            f.write("{0}\n".format(rows.get(i)))
        f.write("\n")
        f.write("Всего вершин: {0}\n".format(num_vertices))
        f.write("Вершина источника: {0}\n".format(vertexSource))
        f.write("Вершина стока: {0}\n".format(vertexStock))
        f.write("Максимальный поток: {0}\n".format(max_flow))
        f.write("Дата и время: {0}\n\n".format(dt.now()))
        f.close()

        return template('maximum_flow', vertexCount=num_vertices, matrix=rows, vertexSource=vertexSource, vertexStock=vertexStock, image='static/images/graph.png', max_flow=max_flow, year=datetime.now().year)