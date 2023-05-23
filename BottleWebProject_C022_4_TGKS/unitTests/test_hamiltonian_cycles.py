import unittest
import logic.hamiltonian_cycles_logic as h

class Test_hamiltonian_cycles(unittest.TestCase):
    def test_getHamCycles_6VerticesUndirectedGraphWithHamCycles_ReturnHamCycles(self):
        #arrange
        graph = [
            [ 0, 1, 1, 0, 0, 1 ], 
            [ 1, 0, 0, 1, 1, 1 ], 
            [ 1, 0, 0, 1, 0, 0 ], 
            [ 0, 1, 1, 0, 1, 0 ], 
            [ 0, 1, 0, 1, 0, 1 ], 
            [ 1, 1, 0, 0, 1, 0 ]  
        ]

        res = [
            [1, 2, 6, 5, 4, 3, 1],
            [1, 3, 4, 2, 5, 6, 1],
            [1, 3, 4, 5, 2, 6, 1],
            [1, 3, 4, 5, 6, 2, 1],
            [1, 6, 2, 5, 4, 3, 1],
            [1, 6, 5, 2, 4, 3, 1]
        ]

        #act
        act = h.getHamCycles(graph)

        #assert
        self.assertEqual(res, act)

    def test_getHamCycles_2VerticesEmptyGraphWithNoHamCycles_ReturnErrorMessage(self):
        #arrange
        graph = [
            [0, 0],
            [0, 0]
        ]

        res = ["В данном графе нет Гамильтоновых циклов!"]

        #act
        act = h.getHamCycles(graph)

        #assert
        self.assertEqual(res, act)

    def test_getHamCycles_3VerticesNotFinishGraphWithNoHamCycles_ReturnErrorMessage(self):
        #arrange
        graph = [
            [0, 1, 0],
            [1, 0, 1],
            [0, 1, 0]
        ]

        res = ["В данном графе нет Гамильтоновых циклов!"]

        #act
        act = h.getHamCycles(graph)

        #assert
        self.assertEqual(res, act)


    def test_getHamCycles_2VerticesUndirectedGraphWithHamCycle_ReturnHamCycle(self):
        #arrange
        graph = [
            [0, 1],
            [1, 0]
        ]

        res = [
            [1, 2, 1]
        ]

        #act
        act = h.getHamCycles(graph)

        #assert
        self.assertEqual(res, act)


    def test_getHamCycles_5VerticesUndirectedGraphWithHamCycles_ReturnHamCycles(self):
        #arrange
        graph = [
            [0, 0, 1, 1, 1],
            [0, 0, 1, 0, 1],
            [1, 1, 0, 1, 1],
			[1, 0, 1, 0, 0],
			[1, 1, 1, 0, 0]
        ]

        res = [
            [1, 4, 3, 2, 5, 1],
            [1, 5, 2, 3, 4, 1]
        ]

        #act
        act = h.getHamCycles(graph)

        #assert
        self.assertEqual(res, act)

 
if __name__ == '__main__':
    unittest.main()