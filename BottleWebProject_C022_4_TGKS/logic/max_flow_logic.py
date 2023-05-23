import networkx as nx

def findMaxFlow(vertexCount, vertexSource, vertexStock, matrix):
    # Cоздаем граф 
    G = nx.DiGraph(directed=True)

    # Добавляем узлы
    for i in range(vertexCount):
        G.add_node(i+1)

    cols = []

    # Нумерация колонок 
    for i in matrix:
        cols.append(i)
    
    # Добавляем ребра и вес, проходясь по матрице 
    colNum = 0
    for row in matrix:
        colNum = 0
        for elem in matrix.get(row):
            if (elem != 0 and elem != ''):
                G.add_edge(row, cols[colNum], capacity = elem)
            colNum += 1

    # Запускаем алгоритм Эдмонда-Карпа
    max_flow = nx.maximum_flow(G, vertexSource, vertexStock, flow_func=nx.algorithms.flow.edmonds_karp)[0]    

    return max_flow, G