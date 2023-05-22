import random
class antitransitivity_class:
    def __init__(self,num_vertex,matrix):
        if(num_vertex<2):
            raise ValueError('Неверно введено количество вершин матрицы')
        
        self.num_vertex=num_vertex
        if(matrix is None or matrix==[]):
            matrix= [[ 0 for x in range(self.num_vertex)] for y in range(self.num_vertex)]
        self.matrix=matrix
    def is_asymmetric(self):
        #функция проверки ассиметричности матрицы,возвращает true если при наличии отношения между 
        #вершинами обратное отношение между ними не может быть истиной,иначе false
        for i in range(len(self.matrix)):
            for j in range(len(self.matrix[0])):
                if self.matrix[i][j] != self.matrix[j][i]:
                    return True
        return False
    def generate_matrix(self):
        self.num_vertex=random.randint(2, 10)
        self.matrix = [[ random.randint(0, 1) for x in range(self.num_vertex)] for y in range(self.num_vertex)]
    def is_antitransitive(self):
        #функция проверки антитранзитивности,если между двумя вершинами существует отношение и они обе имеют отношение
        # к третьей функция возвращает false,иначе true
        for i in range(self.num_vertex):
            for j in range(self.num_vertex):
                if self.matrix[i][j]:   
                    for k in range(self.num_vertex):
                        if self.matrix[j][k] and self.matrix[i][k]:
                            return False
        return True
    def reverse_binary_relation(self):
        #функция нахождения обратного бинарного отношения. Функция возвращает транспорированную матрицу смежности
        rev_matrix=[[0 for i in range(self.num_vertex)] for j in range(self.num_vertex)]
        for i in range(self.num_vertex):
            for j in range(self.num_vertex):
                if self.matrix[i][j]==1:
                    rev_matrix[j][i] = 1
        return rev_matrix