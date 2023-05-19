from bottle import route, request, template, view, datetime

@route('/bin_relation_equality', method='POST')
def submit():
    postdata = request.body.read()
    num_vertices = int(request.forms.get('verticesT'))
    matrix = []
    for i in range(num_vertices):
        row = []
        for j in range(num_vertices):
            cell = request.forms.get('matrix[{}][{}]'.format(i, j))
            row.append(int(cell) if cell else 0)
        matrix.append(row)
    
    # Обработка введенной матрицы смежности
    return template('bin_relation_equality', matrix=matrix, year=datetime.now().year)