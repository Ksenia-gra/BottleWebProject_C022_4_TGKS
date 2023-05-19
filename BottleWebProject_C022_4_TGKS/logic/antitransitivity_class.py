class antitransitivity_class:
    def __init__(self,num_vertex,matrix):
        self.num_vertex=num_vertex
        self.matrix=matrix
    def is_antisymmetric(self):
        for i in range(self.num_vertex):
            for j in range(i, self.num_vertex):
                if self.matrix[i][j] and self.matrix[j][i]:
                    return False
        return True
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