import Foundation

// part 1 O(n*m)
func validCount(_ values: [Policy]) -> Int {
	var counter = 0
	// O(n)
	values.forEach {
		// O(m)
		counter += $0.isValid ? 1 : 0
	}
	return counter
}

// part 1 O(n*m)
func validPositionCount(_ values: [Policy]) -> Int {
	var counter = 0
	// O(n)
	values.forEach {
		// O(m)
		counter += $0.isValidPosition ? 1 : 0
	}
	return counter
}

struct Policy {
	let low: Int
	let high: Int
	let token: Character
	let passwd: String
	
	init(_ range: String, _ token: String, _ passwd: String) {
		let lohi = range.split(separator: "-")
		self.low = Int(lohi[0]) ?? 0
		self.high = Int(lohi[1]) ?? 0
		var token = token
		self.token = token.removeFirst()
		self.passwd = passwd
	}
	
	// O(n)
	var isValid: Bool {
		var counter = 0
		self.passwd.forEach {
			counter += $0 == self.token ? 1 : 0
		}
		return self.low <= counter && counter <= self.high
	}

	// O(2)
	var isValidPosition: Bool {
		var valid = false
		let sarr = Array(self.passwd)
		if self.low <= self.passwd.count {
			if sarr[self.low-1] == self.token {
				valid = !valid
			}
		}
		if self.high <= self.passwd.count {
			if sarr[self.high-1] == self.token {
				valid = !valid
			}
		}
		return valid
	}
}

// read in the input
if let url = URL(string: "\(FileManager.default.homeDirectoryForCurrentUser)ac2020/day2.txt") {
	let raw = (try? String(contentsOf: url)) ?? ""
	let values = raw.split(separator: "\n").map { line -> Policy in
		let segs = line.split(separator: " ").map { String($0) }
		return Policy(segs[0], segs[1], segs[2])
	}
	print(validCount(values))
	print(validPositionCount(values))
}
	