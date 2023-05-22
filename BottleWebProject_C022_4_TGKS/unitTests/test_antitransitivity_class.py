import unittest
import sys
from logic.antitransitivity_class import antitransitivity_class as at

class Test_test_antitransitivity_class(unittest.TestCase):
    def test_is_asymmetric_not_assymetric_matix_return_false(self):
        matrix = [[0, 1, 1], [1, 0, 1], [1, 1, 0]]
        num_vertex = 3
        actual=at(num_vertex,matrix).is_asymmetric()
        self.assertFalse(actual)

    def test_is_asymmetric_assymetric_matix_return_true(self):
        matrix = [[0,1,1,0],[0,0,1,1],[0,0,0,1],[0,0,0,0]]
        num_vertex=4
        actual=at(num_vertex,matrix).is_asymmetric()
        self.assertTrue(actual)

    def test_is_antitransitive_not_antitransitive_matrix_return_false(self):
        matrix = [[1, 1, 0], [0, 1, 1], [1, 0, 1]]
        num_vertex=3
        actual=at(num_vertex,matrix).is_antitransitive()
        self.assertFalse(actual)

    def test_is_antitransitive_antitransitive_matrix_return_true(self):
        matrix = [[0,1, 0, 0], [0,0, 1, 0], [0, 0, 0,1],[0,0,0,0]]
        num_vertex=3
        actual=at(num_vertex,matrix).is_antitransitive()
        self.assertTrue(actual)

    def test_reverse_binary_relation_vertex4_matrix(self):
        matrix=[[1,0,0,0],[0,0,0,1],[1,0,0,0],[0,0,0,1]]
        num_vertex=4
        actual=at(num_vertex,matrix).reverse_binary_relation()
        expected=[[1,0,1,0],[0,0,0,0],[0,0,0,0],[0,1,0,1]]
        self.assertEqual(expected,actual)

    def test_reverse_binary_relation_vertex5_matrix(self):
        matrix=[[0,1,0,1,0],[0,1,0,1,0],[0,0,0,0,1],[1,0,0,1,0],[0,0,0,1,0]]
        num_vertex=5
        actual=at(num_vertex,matrix).reverse_binary_relation()
        expected=[[0,0,0,1,0],[1,1,0,0,0],[0,0,0,0,0],[1,1,0,1,1],[0,0,1,0,0]]
        self.assertEqual(expected,actual)

    def test_init_matrix_none_matrix_return_zero_matrix(self):
        matrix=None
        num_vertex=3
        actual=at(num_vertex,matrix).matrix
        expected=[[0,0,0],[0,0,0],[0,0,0]]
        self.assertEqual(expected,actual)
    def test_init_matrix_vertex_less_two_get_value_error_matrix(self):
        matrix=[[0,0],[0,0]]
        num_vertex=1
        self.assertRaises(ValueError,at,num_vertex,matrix)

if __name__ == '__main__':
    unittest.main()
