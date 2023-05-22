from bottle import route, request, template, view, datetime
import random
from logic.function_of_equality import function_of_equality

@route('/bin_relation_equality', method='POST')
def submit():
    #получение числа вершин графа
    num_vertices = int(request.forms.get('verticesT'))
    matrix = []
    #создание матрицы на основе отмеченных ячеек
    for i in range(num_vertices):
        row = []
        for j in range(num_vertices):
            cell = request.forms.get('matrix[{}][{}]'.format(i, j))
            row.append(int(cell) if cell else 0)
        matrix.append(row)
    Matrix(num_vertices, matrix)
    # Обработка введенной матрицы смежности
    return template('bin_relation_equality', matrix = matrix, res = is_equality, dopMatrix = dop_matrix, year = datetime.now().year)