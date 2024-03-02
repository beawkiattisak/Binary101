import SwiftUI
import Combine

struct Converter: View {
    @State private var binaryInput: String = ""
    @State private var textOutput: String = ""
    @State private var isBinaryToTextMode: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            Text("Converter")
                .font(.system(size: 100))
                .italic()
                .fontWeight(.bold)
                .foregroundStyle(Color(hex : "#18181b"))

            Text(isBinaryToTextMode ? "Binary to Text Converter" : "Text to Binary Converter")
                .font(.system(size: 35, design: .monospaced))
                .fontWeight(.bold)
                .foregroundStyle(Color(hex : "#374151"))
                .padding()

            VStack(alignment: .leading, spacing: 10) {
                Text(isBinaryToTextMode ? "Enter Binary:" : "Enter Text:")
                    .font(.system(size: 25))
                    .foregroundColor(.black)

                TextField(isBinaryToTextMode ? "Enter binary here" : "Enter text here", text: $binaryInput)
                    .padding()
                    .textFieldStyle(PlainTextFieldStyle())
                    .onReceive(Just(binaryInput)) { _ in
                        convert()
                    }
                    .font(.system(size: 45, design: .monospaced))
                    .frame(height: 120)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    .foregroundColor(.black)

            }


            Button(action: {
                isBinaryToTextMode.toggle()
            }) {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300, height: 60)
                    .foregroundColor(.black)
                    .overlay (
                        HStack {
                            Image(systemName: "arrow.up.arrow.down")
                                .font(.system(size: 30))
                                .foregroundStyle(.white)
                            Text("Swap")
                                .font(.system(size: 30, design: .monospaced))
                                .foregroundStyle(.white)
                                .padding()
                                .bold()
                        }
                    )
            }

            VStack(alignment: .leading, spacing: 10) {
                Text(isBinaryToTextMode ? "Text Output:" : "Binary Output:")
                    .font(.system(size: 25))
                    .foregroundColor(.black)

                TextEditor(text: $textOutput)
                    .padding()
                    .frame(height: 300)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    .font(.system(size: 30))
                    .background(Color.clear)
            }
            .frame(maxWidth: .infinity)

        }
        .padding()
    }

    private func convert() {
        if isBinaryToTextMode {
            let binaryArray = binaryInput.components(separatedBy: " ").compactMap { UInt8($0, radix: 2) }
            let textResult = String(bytes: binaryArray, encoding: .utf8) ?? "Invalid binary input"
            textOutput = textResult
        } else {
            let binaryResult = binaryInput.compactMap { $0.asciiValue }.map { String($0, radix: 2) }.joined(separator: " ")
            textOutput = binaryResult
        }
    }
}

#Preview {
    Converter()
}
