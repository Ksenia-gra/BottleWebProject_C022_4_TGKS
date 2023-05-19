from bottle import route, request, template,datetime
#import matplotlib.pyplot as plt

@route('/maximum_flow', method='POST')
def submit():
    num_vertices = int(request.forms.get('vertex'))
    matrix = []
    for i in range(num_vertices):
        row = []
        for j in range(num_vertices):
            cell = request.forms.get('matrix[{}][{}]'.format(i, j))
            row.append(int(cell) if cell else 0)
        matrix.append(row)
    
    return template('maximum_flow', matrix=matrix,year=datetime.now().year)

#def graph():
  # plt.show()