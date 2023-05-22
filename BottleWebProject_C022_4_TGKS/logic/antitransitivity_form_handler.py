from bottle import route, request, template,view,datetime
from logic.antitransitivity_class import antitransitivity_class as at
@route('/bin_relation_transitivity', method='POST')
def submit():
    #получение числа вершин графа
    num_vertices = int(request.forms.get('vertices'))
    matrix = []
    #создание матрицы на основе отмеченных ячеек
    for i in range(num_vertices):
        row = []
        for j in range(num_vertices):
            cell = request.forms.get('matrix[{}][{}]'.format(i, j))
            row.append(int(cell) if cell else 0)
        matrix.append(row)
    #создание экземпляра класса (графа)
    graf=at(num_vertices,matrix)
    if 'solveTaskGenerate' in request.forms:
        #если нажата кнопка сгенерировать и решить задачу генирация матрицы происходит рандомно
        graf.generate_matrix()
        num_vertices=graf.num_vertex
    #проверка антитранзитивности и ассиметричности
    is_assim=graf.is_asymmetric()
    is_antit=graf.is_antitransitive()
    str_assim_antit="Бинарное отношение не обладает одновременно свойствами антитранзитивности и ассиметриности"
    num_vertices=str(num_vertices)
    graf.logging_to_file("log_files/antitransitivity_log.txt")
    if 'resetBtn' in request.forms:
        #если нажата кнопка сбросить матрицу
        return template('bin_relation_transitivity', matrix=[],year=datetime.now().year,str_assim_antit=''
                        ,rev_matrix=[],rev_matr_str='',vert=num_vertices)
    if 'solveTask' or 'solveTaskGenerate' in request.forms:
    #если нажата кнопка решить задачу
    # Обработка введенной матрицы смежности
        rev_matrix=graf.reverse_binary_relation()
        if (is_assim and is_antit):
            str_assim_antit="Бинарное отношение обладает одновременно свойствами антитранзитивности и ассиметриности"
        return template('bin_relation_transitivity',matrix=graf.matrix,year=datetime.now().year,str_assim_antit=str_assim_antit
                        ,rev_matrix=rev_matrix,rev_matr_str="Обратная матрица:",vert=num_vertices)