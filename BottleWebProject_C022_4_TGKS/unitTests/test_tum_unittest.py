import unittest
import sys
from logic.function_of_equality import function_of_equality

class test_function_of_equality_check_tests(unittest.TestCase):
    def test_is_equality_matrix_matrix_are_equality(self):
        #arrange
        vert = 6
        matrix = [[1, 0, 0, 0, 0, 1], [0, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 0], [1, 0, 0, 0, 0, 1]]
        expected = "Заданное бинарное отношение является эквивалентным."

        #act
        example = function_of_equality(vert, matrix)
        result = example.is_equality_matrix()

        #assert
        self.assertEqual(result, expected)


    def test_is_equality_matrix_big_matrix_are_equality(self):
        #arrange
        vert = 10
        matrix = [[1, 0, 0, 0, 0, 1, 0, 1, 1, 1], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0],
                 [0, 1, 1, 1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 1, 0, 1, 1, 1],
                 [0, 0, 0, 0, 0, 0, 1, 0, 0, 0], [1, 0, 0, 0, 0, 1, 0, 1, 1, 1], [1, 0, 0, 0, 0, 1, 0, 1, 1, 1],
                 [1, 0, 0, 0, 0, 1, 0, 1, 1, 1]]
        expected = "Заданное бинарное отношение является эквивалентным."

        #act
        example = function_of_equality(vert, matrix)
        result = example.is_equality_matrix()

        #assert
        self.assertEqual(result, expected)


    def test_is_equality_matrix_little_matrix_are_equality(self):
        #arrange
        vert = 4
        matrix = [[1, 0, 0, 0], [0, 1, 1, 0], [0, 1, 1, 0], [0, 0, 0, 1]]
        expected = "Заданное бинарное отношение является эквивалентным."

        #act
        example = function_of_equality(vert, matrix)
        result = example.is_equality_matrix()

        #assert
        self.assertEqual(result, expected)


    def test_is_equality_matrix_little_matrix_are_not_equality(self):
        #arrange
        vert = 3
        matrix = [[1, 0, 0], [1, 1, 1], [0, 1, 1]]
        expected = "Заданное бинарное отношение не является эквивалентным."

        #act
        example = function_of_equality(vert, matrix)
        result = example.is_equality_matrix()

        #assert
        self.assertEqual(result, expected)


    def test_is_equality_matrix_refleks_matrix_are_not_equality(self):
        #arrange
        vert = 10
        matrix = [[1, 0, 0, 0, 0, 1, 0, 1, 1, 0], [0, 1, 1, 1, 0, 1, 0, 1, 1, 0], [0, 1, 1, 0, 0, 1, 0, 1, 1, 0],
                 [0, 0, 0, 1, 0, 1, 0, 1, 1, 0], [0, 0, 0, 1, 1, 0, 0, 1, 1, 0], [0, 0, 0, 1, 1, 1, 0, 1, 1, 0],
                 [0, 0, 0, 1, 0, 1, 1, 1, 1, 0], [0, 0, 0, 1, 1, 0, 0, 1, 1, 0], [0, 0, 0, 1, 1, 0, 0, 1, 1, 0],
                 [1, 0, 0, 0, 0, 1, 0, 1, 1, 1]]
        expected = "Заданное бинарное отношение не является эквивалентным."

        #act
        example = function_of_equality(vert, matrix)
        result = example.is_equality_matrix()

        #assert
        self.assertEqual(result, expected)


    def test_is_equality_matrix_matrix_are_not_equality(self):
        #arrange
        vert = 5
        matrix = [[1, 0, 0, 0, 0], [0, 1, 1, 1, 0], [0, 1, 1, 0, 0], [0, 0, 0, 1, 0], [0, 0, 0, 1, 1]]
        expected = "Заданное бинарное отношение не является эквивалентным."

        #act
        example = function_of_equality(vert, matrix)
        result = example.is_equality_matrix()

        #assert
        self.assertEqual(result, expected)


    def test_Dop_Relation_equality_matrix_right_equality_matrix(self):
        #arrange
        vert = 8
        matrix = [[1, 0, 0, 0, 0, 1, 0, 1], [0, 1, 1, 1, 0, 1, 0, 1], [0, 1, 1, 0, 0, 1, 0, 1], [0, 0, 0, 1, 0, 1, 0, 1],
                 [0, 0, 0, 1, 1, 0, 0, 1], [0, 0, 0, 1, 1, 0, 0, 1], [0, 0, 0, 1, 1, 0, 0, 1], [0, 0, 0, 1, 1, 0, 0, 1]]
        expected = [[0, 1, 1, 1, 1, 0, 1, 0], [1, 0, 0, 0, 1, 0, 1, 0], [1, 0, 0, 0, 1, 0, 1, 0], [1, 1, 1, 0, 1, 0, 1, 0],
                   [1, 1, 1, 0, 0, 1, 1, 0], [1, 1, 1, 0, 0, 1, 1, 0], [1, 1, 1, 0, 0, 1, 1, 0], [1, 1, 1, 0, 0, 1, 1, 0]]

        #act
        example = function_of_equality(vert, matrix)
        result = example.Dop_Relation()

        #assert
        self.assertEqual(result, expected)


    def test_Dop_Relation__notequality_matrix_right_not_equality_matrix(self):
        #arrange
        vert = 3
        matrix = [[0, 1, 0], [1, 0, 0], [1, 1, 0]]
        expected = [[1, 0, 1], [0, 1, 1], [0, 0, 1]]

        #act
        example = function_of_equality(vert, matrix)
        result = example.Dop_Relation()

        #assert
        self.assertEqual(result, expected)


if __name__ == '__main__':
    unittest.main()