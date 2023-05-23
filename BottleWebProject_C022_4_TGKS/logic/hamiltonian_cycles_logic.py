# Функция для проверки того, может ли вершина v быть добавлена по индексу pos в гамильтонов цикл
def isAddingSafe(v, graph, path, pos):

	# Если вершина смежна с вершиной, добавленной ранее
	if graph[path[pos - 1]][v] == 0:
		return False

	# Если вершина уже была включена в путь
	for i in range(pos):
		if path[i] == v:
			return False
		
	return True

# Для проверки наличия Гамильтонова цикла
hasCycle = False
cycles = list()

# Функция для нахождения всех возможных гамильтоновых циклов
def getHamCycles(graph):
	global hasCycle
	global cycles

	cycles = []
	hasCycle = False

	# Для хранения вершин - пути
	path = []
	path.append(0)

	# Отслеживание посещенных вершин
	visited = [False]*(len(graph))

	visited[0] = True

	# Вызов функции для поиска всех гамильтоновых циклов
	findHamCycle(graph, 1, path, visited)

	if hasCycle == False:
		# Если для данного графа невозможен гамильтонов цикл, то
		return ["В данном графе нет Гамильтоновых циклов!"]

	return cycles

# Рекурсивная функция для нахождения всех гамильтоновых циклов
def findHamCycle(graph, pos, path, visited):

	global hasCycle
	global cycles

	# Если все вершины включены в гамильтонов цикл
	if pos == len(graph):
	
		# Если есть ребро от последней вершины до исходной вершины
		if graph[path[-1]][path[0]] != 0:
		
			# Include source vertex into the path and print the path
			path.append(0)

			for i in range(len(path)):
				path[i] += 1

			cycles.append(list(path))

			for i in range(len(path)):
				path[i] -= 1

			# Удалите добавленную исходную вершину
			path.pop()

			# Обновите hasCycle
			hasCycle = True
		return

	# Попробуйте разные вершины в качестве следующей вершины
	for v in range(len(graph)):
	
		# Проверьте, можно ли добавить эту вершину в цикл
		if isAddingSafe(v, graph, path, pos) and not visited[v]:
			path.append(v)
			visited[v] = True

			# Повторите, чтобы построить остальную часть пути
			findHamCycle(graph, pos + 1, path, visited)

			# Удалите текущую вершину из пути и обработайте другие вершины
			visited[v] = False
			path.pop()