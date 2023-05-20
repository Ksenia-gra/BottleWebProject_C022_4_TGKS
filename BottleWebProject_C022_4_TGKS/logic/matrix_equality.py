from bottle import route, request, template, view, datetime
from logic.function_of_equality import function_of_equality

@route('/bin_relation_equality', method='POST')
def submit():
    num_vertices = int(request.forms.get('verticesT'))
    matrix = []
    for i in range(num_vertices):
        row = []
        for j in range(num_vertices):
            cell = request.forms.get('matrix[{}][{}]'.format(i, j))
            row.append(int(cell) if cell else 0)
        matrix.append(row)
    #вызов функции с результатом
    enterMatrix = function_of_equality(num_vertices, matrix)
    is_equality = enterMatrix.is_equality_matrix() + " Ниже преведено дополнительное отншоение заданного: "
    dop_matrix = enterMatrix.dop_relation()

    # Обработка введенной матрицы смежности
    return template('bin_relation_equality', matrix = matrix, res = is_equality, dopMatrix = dop_matrix, year = datetime.now().year)