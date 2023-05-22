import unittest
from logic.function_of_equality import function_of_equality

class test_function_of_equality_check_tests(unittest.TestCase):
    def test_function_of_equality_matrix_are_equality(self):
        #arrange
        vert = 6
        matrix = [[1, 0, 0, 0, 0, 1], [0, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 0], [1, 0, 0, 0, 0, 1]]
        expected = "Заданное бинарное отношение является эквивалентным."

        #act
        example = function_of_equality(vert, matrix)
        result = example.Matrix()

        #assert
        self.assertEqual(result, expected)

    def test_function_of_equality_matrix_are_not_equality(self):
        #arrange
        vert = 10
        matrix = [[1, 0, 0, 0, 0, 1, 0, 1, 1, 0], [0, 1, 1, 1, 0, 1, 0, 1, 1, 0], [0, 1, 1, 0, 0, 1, 0, 1, 1, 0],
                                  [0, 0, 0, 1, 0, 1, 0, 1, 1, 0], [0, 0, 0, 1, 1, 0, 0, 1, 1, 0], [0, 0, 0, 1, 1, 0, 0, 1, 1, 0],
                                  [0, 0, 0, 1, 0, 1, 0, 1, 1, 0], [0, 0, 0, 1, 1, 0, 0, 1, 1, 0], [0, 0, 0, 1, 1, 0, 0, 1, 1, 0],
                                  [1, 0, 0, 0, 0, 1, 0, 1, 1, 0]]
        expected = "Заданное бинарное отношение не является эквивалентным."

        #act
        example = function_of_equality(vert, matrix)
        result = example.Matrix()

        #assert
        self.assertEqual(result, expected)

    def test_function_of_equality_Dop_Relation_right(self):
        #arrange
        vert = 3
        matrix = [[0, 1, 0], [1, 0, 0], [1, 1, 0]]
        expected = [[1, 0, 1], [0, 1, 1], [0, 0, 1]]

        #act
        example = function_of_equality(vert, matrix)
        result = example.Dop_Relation()

        #assert
        self.assertEqual(result, expected)