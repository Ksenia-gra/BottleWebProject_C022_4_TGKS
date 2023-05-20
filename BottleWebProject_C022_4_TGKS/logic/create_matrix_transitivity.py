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
    #проверка антитранзитивности и ассиметричности
    is_assim=graf.is_asymmetric()
    is_antit=graf.is_antitransitive()
    str_assim_antit="Бинарное отношение не обладает одновременно свойствами антитранзитивности и ассиметриности"
         # Обработка введенной матрицы смежности
    if 'printMatr' in request.forms:
        #обработка нажатия на кнопку вывести матрицу
        return template('bin_relation_transitivity', matrix=matrix,year=datetime.now().year,str_assim_antit='',rev_matrix=[],rev_matr_str='')
    elif 'checkAssim' in request.forms:
        #обработка нажатия на кнопку ассиметричности и антитранзитивность. В зависимости от ранее полученных 
        #результатов методов класса
        if (is_assim and is_antit):
            str_assim_antit="Бинарное отношение обладает одновременно свойствами антитранзитивности и ассиметриности"
        return template('bin_relation_transitivity', matrix=matrix,year=datetime.now().year,str_assim_antit=str_assim_antit
                        ,rev_matrix=[],rev_matr_str='')
    else:
        #нажатие на кнопку обратное бинарное отношение
        rev_matrix=graf.reverse_binary_relation()
        return template('bin_relation_transitivity', matrix=matrix,year=datetime.now().year,str_assim_antit='',rev_matrix=rev_matrix,rev_matr_str="Обратная матрица:")