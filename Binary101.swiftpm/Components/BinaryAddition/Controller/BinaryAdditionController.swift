import Foundation
import SwiftUI

class BinaryAdditionController: ObservableObject {
    @Published var binaryNumber1: String
    @Published var binaryNumber2: String
    @Published var result: String

    init() {
        self.binaryNumber1 = BinaryAdditionController.generateRandomBinaryNumber(length: 5)
        self.binaryNumber2 = BinaryAdditionController.generateRandomBinaryNumber(length: 5)
        self.result = ""
        calculateResult()
    }

    func generateRandomBinaryNumber() {
        self.binaryNumber1 = BinaryAdditionController.generateRandomBinaryNumber(length: 5)
        self.binaryNumber2 = BinaryAdditionController.generateRandomBinaryNumber(length: 5)
        calculateResult()
    }

    func calculateResult() {
        result = ""

        let binary1 = binaryNumber1
        let binary2 = binaryNumber2
        let maxLength = max(binary1.count, binary2.count)
        let paddedBinary1 = binary1.padding(toLength: maxLength, withPad: "0", startingAt: 0)
        let paddedBinary2 = binary2.padding(toLength: maxLength, withPad: "0", startingAt: 0)

        var carry = 0
        var sum = ""

        for i in (0..<maxLength).reversed() {
            let bit1 = Int(String(paddedBinary1[paddedBinary1.index(paddedBinary1.startIndex, offsetBy: i)])) ?? 0
            let bit2 = Int(String(paddedBinary2[paddedBinary2.index(paddedBinary2.startIndex, offsetBy: i)])) ?? 0

            let tempSum = bit1 + bit2 + carry
            let resultBit = tempSum % 2
            carry = tempSum / 2

            sum = String(resultBit) + sum
        }

        if carry > 0 {
            sum = "1" + sum
        }

        result = sum
    }

    static func generateRandomBinaryNumber(length: Int) -> String {
        var binaryNumber = ""

        for _ in 0..<length {
            let bit = Int.random(in: 0...1)
            binaryNumber.append(String(bit))
        }

        return binaryNumber
    }
}
