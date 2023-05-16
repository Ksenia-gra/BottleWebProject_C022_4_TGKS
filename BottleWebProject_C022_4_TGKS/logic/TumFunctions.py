import random

@post('/bin_relation_equality', method='relations')
def Matrix():

    n = 0
    matrix = [[] * n for i in range(n)]
    for i in matrix:
        for i2 in i:
            matrix[i][i2] = random.randint(0, 1)

    res = ""

    for i in range(n):
        for i2 in range(n):
                if (matrix[i][i2] == 1) and (matrix[i][i2] == matrix[i2][i]) and (i == i2):
                    for i3 in range(n):
                        if (matrix[i2][i3] == 1 and matrix[i3][i] == 1): res = "The binary relation is an equivalence relation."
                else: result = "The binary relation is not an equivalence relation."
    return template('index.tpl', result = res)