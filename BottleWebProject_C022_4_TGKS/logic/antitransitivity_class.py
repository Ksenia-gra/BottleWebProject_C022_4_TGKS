class antitransitivity_class:
    def __init__(self,num_vertex,matrix):
        self.num_vertex=num_vertex
        self.matrix=matrix
    def is_asymmetric(self):
        for i in range(len(self.matrix)):
            for j in range(len(self.matrix[0])):
                if self.matrix[i][j] != self.matrix[j][i]:
                    return True
        return False
    def is_antitransitive(self):
        for i in range(self.num_vertex):
            for j in range(self.num_vertex):
                if self.matrix[i][j]:
                    for k in range(self.num_vertex):
                        if self.matrix[j][k] and self.matrix[i][k]:
                            return False
        return True
    def reverse_binary_relation(self):
        rev_matrix=[[0 for i in range(self.num_vertex)] for j in range(self.num_vertex)]
        for i in range(self.num_vertex):
            for j in range(self.num_vertex):
                if self.matrix[i][j]==1:
                    rev_matrix[j][i] = 1
        return rev_matrix