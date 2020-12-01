import Foundation

// part 1 - O(n)
func findDuo(_ values: [Int], _ target: Int) -> Int {
	var seen: [Int: Int] = [:]
	for i in 0..<values.count {
		let y = values[i]
		let x = target - y
		if seen[x] != nil {
			// found duo
			return x * y
		} else {
			seen[y] = 0
		}
	}
	return 0
}

// part 2 - dp O(2 * n log n + n) => O(n log n)
func findTrio(_ values: [Int], _ target: Int) -> Int {
	let lvals = Set(values) // O(n log n)
	let svals = values.sorted() // O(n log n)

	for pass in 0...1 {
		var i = 0
		var j = svals.count - 1
		while i < j {
			let diff = target - (svals[j] + svals[i])
			if lvals.contains(diff) {
				// found trio
				return svals[i] * diff * svals[j]
			}
			if diff <= svals[i] {
				// j is too high
				j -= 1
			} else if diff >= svals[j]  {
				// i is too low
				i += 1
			} else {
				// in i-j range, but i or j is invalid, 
				// pass 0 will check i, pass 1 will check j
				if pass == 0 {
					i += 1
				} else {
					j -= 1
				}
			}
		}
	}
	
	return 0
}

// read in the input
if let url = URL(string: "\(FileManager.default.homeDirectoryForCurrentUser)ac2020/day1.txt") {
	let raw = (try? String(contentsOf: url)) ?? ""
	let values = raw.split(separator: "\n").map {
		Int($0)! // make things easy
	}
	print(findDuo(values, 2020))
	print(findTrio(values, 2020))
}
