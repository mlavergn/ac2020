import Foundation

// part 1
func solve1(_ values: [[String]]) -> Int {
	var counter = 0
	// O(n)
	values.forEach { 
		counter += $0.count
	}
	return counter
}

// read in the input
if let url = URL(string: "\(FileManager.default.homeDirectoryForCurrentUser)ac2020/day0.txt") {
	let raw = (try? String(contentsOf: url)) ?? ""
	let values = raw.split(separator: "\n").map { line -> [String] in
		let segs = line.split(separator: " ").map { String($0) }
		return segs
	}
	print(solve1(values))
}
	