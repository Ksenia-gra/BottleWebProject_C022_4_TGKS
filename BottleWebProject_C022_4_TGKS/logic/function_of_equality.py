from bottle import route, request, template,view,datetime,post

class function_of_equality:
    def __init__(self, num_vert, matrix):
        self.num_vert = num_vert
        self.matrix = matrix

    def is_equality_matrix(self):
        n = self.num_vert
        matrix = [[0] * n for i in range(n)]
        matrix = self.matrix
        a = 0
        matrixDop = [[0] * n for i in range(n)]

        for i in range(n):
            for i2 in range(n):
                    if (matrix[i][i2] == 1 and i == i2):
                       a+=1
                    elif (matrix[i][i2] == 1 and matrix[i][i2] == matrix[i2][i]):
                        if (matrix[i][i2] == 1):
                            for i3 in range(n):
                                if (matrix[i2][i3] == 1 and matrix[i3][i] == 1 and i2!=i3):
                                   a += 1
                    elif matrix[i][i2]==0: a+=1
                    else: break
        if a >= (n*n): return "Заданное бинарное отношение является эквивалентным."
        else: return "Заданное бинарное отношение не является эквивалентным."


    def dop_relation(self):
        n = self.num_vert
        matrix = [[0] * n for i in range(n)]
        matrixDop = [[0] * n for i in range(n)]
        matrix = self.matrix

        for i in range(n):
            for i2 in range(n):
                    if matrix[i][i2] == 1:
                        matrixDop[i][i2] = 0
                    else: matrixDop[i][i2] = 1

        return matrixDop