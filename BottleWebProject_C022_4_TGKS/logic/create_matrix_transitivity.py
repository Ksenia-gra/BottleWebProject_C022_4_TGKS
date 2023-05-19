from bottle import route, request, template,view,datetime
from logic.antitransitivity_class import antitransitivity_class as at
@route('/bin_relation_transitivity', method='POST')
def submit():
    num_vertices = int(request.forms.get('vertices'))
    matrix = []
    for i in range(num_vertices):
        row = []
        for j in range(num_vertices):
            cell = request.forms.get('matrix[{}][{}]'.format(i, j))
            row.append(int(cell) if cell else 0)
        matrix.append(row)
    graf=at(num_vertices,matrix)
         # Обработка введенной матрицы смежности
    if 'printMatr' in request.forms:
        return template('bin_relation_transitivity', matrix=matrix,year=datetime.now().year,str_assim='',
                        str_antit='',rev_matrix=[])
    elif 'checkAssim' in request.forms:
        is_assim=graf.is_antisymmetric()
        str_assim="Матрица не ассиметрична"
        if (is_assim):
            str_assim="Матрица ассиметрична"
        return template('bin_relation_transitivity', matrix=matrix,year=datetime.now().year,str_assim=str_assim,
                        str_antit='',rev_matrix=[])
    elif 'checkAntit' in request.forms:
        is_antit=graf.is_antitransitive()
        str_antit="Матрица не антитранзитивна"
        if (is_antit):
            str_assim="Матрица антитранзитивна"
        return template('bin_relation_transitivity', matrix=matrix,year=datetime.now().year,str_assim='',
                        str_antit=str_assim,rev_matrix=[])
    else:
        rev_matrix=graf.reverse_binary_relation()
        return template('bin_relation_transitivity', matrix=matrix,year=datetime.now().year,str_assim='',
                        str_antit='',rev_matrix=rev_matrix)