import SwiftUI

extension String {
    mutating func replace(at index: Int, with newChar: Character) {
        self.remove(at: self.index(startIndex, offsetBy: index))
        self.insert(newChar, at: self.index(startIndex, offsetBy: index))
    }
}

extension String {
    func character(at index: Int) -> Character? {
        guard index >= 0 && index < count else { return nil }
        return self[self.index(startIndex, offsetBy: index)]
    }
}

extension String {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

