import Foundation

// part 1
func solve1(_ grid: Grid, slope: [Int]) -> Int {
	var counter = 0
	while grid.move(x: slope[0], y: slope[1]) != true {
		counter += grid.isTree ? 1 : 0
	}
	return counter
}

// part 2
func solve2(_ grid: Grid, slopes: [[Int]]) -> Int {
	var counter = 1
	slopes.forEach { slope in
		grid.reset()
		let trees = solve1(grid, slope: slope)
		counter *= (trees == 0 ? 1 : trees)
	}
	
	return counter
}

class Grid {
	var X = 0
	var Y = 0
	let grid: [[Character]]
	
	init(_ grid: [[Character]]) {
		self.grid = grid
	}
	
	func reset() {
		self.X = 0
		self.Y = 0
	}
	
	// Return true if at destination
	func move(x: Int, y: Int) -> Bool {
		self.X += x
		self.Y += y
		
		self.X %= self.grid[0].count
		if self.Y >= self.grid.count {
			self.Y = self.grid.count - 1
			return true
		}
		
		return false
	}
	
	// Return true if at a tree
	var isTree: Bool {
		self.grid[self.Y][self.X] == Character("#")
	}
}

// read in the input
if let url = URL(string: "\(FileManager.default.homeDirectoryForCurrentUser)ac2020/day3.txt") {
	let raw = (try? String(contentsOf: url)) ?? ""
	let data = raw.split(separator: "\n").map { line -> [Character] in
		return Array(line)
	}
	let grid = Grid(data)
	print(solve1(grid, slope: [3, 1]))
	print(solve2(grid, slopes: [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]))
}
	