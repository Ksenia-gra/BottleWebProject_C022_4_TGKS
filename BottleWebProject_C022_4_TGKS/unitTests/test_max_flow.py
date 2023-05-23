import unittest
import logic.max_flow_logic as mf

class Test_max_flow(unittest.TestCase):

     def test_getValue_ThreeVertexSecondSourceFirstStockRandomWeights_ShowResultNinetyFour(self):
        #arrange
        vertexSource = 2
        vertexStock = 1
        vertexCount = 3
        matrix = { 2: [0, 34, 60], 3: [0, 0, 53], 1: [0, 0, 0] }

        res = 94

        #actual
        actual = mf.findMaxFlow(vertexCount, vertexSource, vertexStock, matrix)[0]    

        #assert
        self.assertEquals(res, actual)

     def test_getValue_TwoVertexFirstSourceSecondStockZeroWeights_ShowResultZero(self):
        #arrange
        vertexSource = 1
        vertexStock = 2
        vertexCount = 2
        matrix = { 1: [0, 0], 2: [0, 0] }

        res = 0

        #actual
        actual = mf.findMaxFlow(vertexCount, vertexSource, vertexStock, matrix)[0]    

        #assert
        self.assertEquals(res, actual)

     def test_getValue_TwoVertexFirstSourceSecondStockFiveWeightFromSource_ShowResultFive(self):
        #arrange
        vertexSource = 1
        vertexStock = 2
        vertexCount = 2
        matrix = { 1: [0, 5], 2: [0, 0] }

        res = 5

        #actual
        actual = mf.findMaxFlow(vertexCount, vertexSource, vertexStock, matrix)[0]    

        #assert
        self.assertEquals(res, actual)

     def test_getValue_TwoVertexFirstSourceSecondStockFiveWeightFromStock_ShowResultZero(self):
        #arrange
        vertexSource = 1
        vertexStock = 2
        vertexCount = 2
        matrix = { 1: [0, 0], 2: [5, 0] }

        res = 0

        #actual
        act = mf.findMaxFlow(vertexCount, vertexSource, vertexStock, matrix)[0]    

        #assert
        self.assertEquals(res, act)

     def test_getValue_FourVertexThirdSourceFourthStockRandomWeights_ShowResult189(self):
        #arrange
        vertexSource = 3
        vertexStock = 4
        vertexCount = 4
        matrix = { 3: [0, 42, 62, 92], 1: [0, 0, 0, 68], 2: [0, 22, 0, 33], 4:[0, 0, 0, 0] }

        res = 189

        #actual
        act = mf.findMaxFlow(vertexCount, vertexSource, vertexStock, matrix)[0]    
        
        #assert
        self.assertEquals(res, act)

     def test_getValue_ThreeVertexSecondSourceFirstStockNoEdgesToStock_ShowResult0(self):
        #arrange
        vertexSource = 2
        vertexStock = 1
        vertexCount = 3
        matrix = { 2: [0, 5, 0], 3: [0, 0, 0], 1: [10, 0, 0] }

        res = 0

        #actual
        act = mf.findMaxFlow(vertexCount, vertexSource, vertexStock, matrix)[0]    
        
        #assert
        self.assertEquals(res, act)

     def test_getValue_ThreeVertexSecondSourceFirstStockCircleCycle_ShowResult5(self):
        #arrange
        vertexSource = 2
        vertexStock = 1
        vertexCount = 3
        matrix = { 2: [0, 5, 0], 3: [0, 0, 10], 1: [10, 0, 0] }

        res = 5

        #actual
        act = mf.findMaxFlow(vertexCount, vertexSource, vertexStock, matrix)[0]    
        
        #assert
        self.assertEquals(res, act)

if __name__ == '__main__':
    unittest.main()
