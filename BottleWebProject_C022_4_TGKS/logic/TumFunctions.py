from bottle import route, request, template,view,datetime,post
import random

def Matrix(num_vert, matrixD):
    
    n = num_vert
    matrix = [[0] * n for i in range(n)]
    matrix = matrixD
    
    a = 0
    res = ""
    matrixDop = [[0] * n for i in range(n)]
    #for i in matrix:
    #    for i2 in i:
    #        matrix[i][i2] = random.randint(0, 1)

    for i in range(n):
        for i2 in range(n):
                if (matrix[i][i2] == 1 and i == i2):
                   a += 1
                elif (matrix[i][i2] == 1 and matrix[i][i2] == matrix[i2][i]):
                    if (matrix[i][i2] == 1):
                        for i3 in range(n):
                            if (matrix[i2][i3] == 1 and matrix[i3][i] == 1 and i2 != i3):
                               a += 1
                elif matrix[i][i2] == 0: a += 1
                else: break
    if a >= (n * n): res = "Заданное бинарное отношение является эквивалентным."
    else: res = "Заданное бинарное отношение не является эквивалентным."

    for i in range(n):
        for i2 in range(n):
                if matrix[i][i2] == 1:
                    matrixDop[i][i2] = 0
                else: matrixDop[i][i2] = 1

    return template('bin_relation_equality', matrix = matrixD, result = res, dopMatrix = matrixDop, year=datetime.now().year)