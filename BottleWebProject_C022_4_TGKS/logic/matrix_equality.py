from bottle import route, request, template, view, datetime
import random
from logic.function_of_equality import function_of_equality as foe

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
   #создание экземпляра класса
    enterMatrix = foe(num_vertices, matrix)

    if 'randomGenerate' in request.forms:
        #если нажата кнопка сгенерировать и решить задачу генирация матрицы происходит рандомно
        for i in range(num_vertices):
            for i2 in range(num_vertices):
                    enterMatrix.matrix[i][i2] = random.randint(0, 1)
    is_equality = enterMatrix.is_equality_matrix() + " Ниже преведено дополнительное отношение заданного: "
    dop_matrix = enterMatrix.dop_relation()
    return template('bin_relation_equality', matrix = matrix, res = is_equality, dopMatrix = dop_matrix, year = datetime.now().year)