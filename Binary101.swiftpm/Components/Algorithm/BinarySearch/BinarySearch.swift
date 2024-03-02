import SwiftUI

struct BinarySearch: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Image(systemName: "newspaper")
                                .foregroundStyle(.black)
                                .font(.system(size: 50))
                            Text("Detailed")
                                .foregroundStyle(.black)
                                .font(.system(size: 50, design: .monospaced))
                                .bold()
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)

                        Text("Binary Search is an algorithm used to find the position of a target value within a sorted array. It works by repeatedly dividing the search range in half.")
                            .font(.system(size: 30, design: .monospaced))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                    }
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))

                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Image(systemName: "doc")
                                .foregroundStyle(.black)
                                .font(.system(size: 50))
                            Text("Code Sample (Swift)")
                                .foregroundStyle(.black)
                                .font(.system(size: 50, design: .monospaced))
                                .bold()
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)

                        Text("""
func binarySearch(array: [Int], target: Int) -> Int? {
    var low = 0
    var high = array.count - 1

    while low <= high {
        let mid = (low + high) / 2

        if array[mid] == target {
            return mid
        } else if array[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }

    return nil
}
""")
                        .font(.system(size: 30, design: .monospaced))
                        .foregroundStyle(.gray)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    }
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Binary Search")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}
