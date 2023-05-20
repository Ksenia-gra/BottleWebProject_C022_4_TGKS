import unittest
from logic.antitransitivity_class import antitransitivity_class as at
class Test_test_antitransitivity_class(unittest.TestCase):
    def test_not_assymetric_matix_return_false(self):
        matrix=[[0,1,1][1,0,1][1,1,0]]
        num_vertex=3

        self.fail("Not implemented")

if __name__ == '__main__':
    unittest.main()
