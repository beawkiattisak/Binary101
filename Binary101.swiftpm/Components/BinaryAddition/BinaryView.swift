import SwiftUI

struct BinaryView: View {
    @State private var selectedCharacterIndex: Int?
    @State private var isAlertPresented: Bool = false
    @State private var isAnswerCorrect: Bool = false
    @State private var submitted: Bool = false
    
    @State private var userAnswer: String = String(repeating: "0", count: 0)
    
    @StateObject private var viewModel = BinaryAdditionController()
    
    init() {
        _userAnswer = State(initialValue: String(repeating: "0", count: BinaryAdditionController().result.count))
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Binary Addition")
                    .font(.system(size: 60, design: .monospaced))
                    .bold()
                    .italic()
            }
            .padding(.top, 20)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                HStack {
                    Binary(text: viewModel.binaryNumber1)
                        .onTapGesture {
                            resetSelection()
                        }
                }
                HStack(alignment: .top) {
                    Binary(text: viewModel.binaryNumber2)
                }
                HStack(alignment: .top) {
                    BinaryAnswer(userAnswer: $userAnswer, selectedCharacterIndex: $selectedCharacterIndex, correctAnswer: viewModel.result)
                }
                .padding(.top, 20)
                
            }
            .padding(.bottom, 55)
            
            Spacer()
            Button(action: {
                checkAnswer()
            }) {
                Text("Submit")
                    .font(.system(size: 30, design: .monospaced))
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 80)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .bold()
                    .cornerRadius(10)
            }
            .padding(.bottom, 60)
        }
        .padding()
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text(isAnswerCorrect ? "Correct 🎉" : "Try again 🤔"),
                message: Text("The answer is \(isAnswerCorrect ? "correct" : "incorrect")."),
                dismissButton: .default(Text("OK")) {
                    resetSelection()
                }
            )
        }
    }
    
    private func resetSelection() {
        selectedCharacterIndex = nil
        isAnswerCorrect = false
    }
    
    private func checkAnswer() {
        let newLength = viewModel.result.count
        let adjustedUserAnswer = userAnswer.padding(toLength: newLength, withPad: "0", startingAt: 0)
        
        isAnswerCorrect = adjustedUserAnswer == viewModel.result
        
        isAlertPresented = true
        submitted = true
        
        userAnswer = String(repeating: "0", count: newLength)
        
        if isAnswerCorrect {
            viewModel.generateRandomBinaryNumber()
        }
    }
}



struct Binary: View {
    let text: String

    var body: some View {
        HStack {
            ForEach(Array(text), id: \.self) { char in
                Rectangle()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    .overlay(
                        Text(String(char))
                            .foregroundStyle(.white)
                            .font(.system(size: 50, design: .monospaced))
                    )
            }
        }
    }
}


struct BinaryAnswer: View {
    @Binding var userAnswer: String
    @Binding var selectedCharacterIndex: Int?
    let correctAnswer: String

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<correctAnswer.count, id: \.self) { index in
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(selectedCharacterIndex == index ? Color.black : Color.gray, lineWidth: selectedCharacterIndex == index ? 6 : 4)
                        )
                        .onTapGesture {
                            withAnimation {
                                selectedCharacterIndex = index
                                toggleCharacter(at: index)
                            }
                        }

                    if index < userAnswer.count {
                        Text(String(userAnswer[userAnswer.index(userAnswer.startIndex, offsetBy: index)]))
                            .foregroundStyle(.black)
                            .font(.system(size: 50, design: .monospaced))
                            .contentShape(Rectangle())
                    } else {
                        Text(index == correctAnswer.count - 1 ? "0" : "1")
                            .foregroundColor(.black)
                            .font(.system(size: 50, design: .monospaced))
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if userAnswer.last != "1" {
                                    selectedCharacterIndex = index
                                    toggleCharacter(at: index)
                                }
                            }
                    }
                }
            }
        }
    }

    private func toggleCharacter(at index: Int) {
        if index < userAnswer.count {
            guard let stringIndex = userAnswer.index(userAnswer.startIndex, offsetBy: index, limitedBy: userAnswer.endIndex) else { return }
            let currentChar = userAnswer[stringIndex]
            let newChar = currentChar == "0" ? "1" : "0"
            userAnswer.replaceSubrange(stringIndex..<userAnswer.index(after: stringIndex), with: String(newChar))
        } else if userAnswer.count < correctAnswer.count {
            
            let insertChar = index == correctAnswer.count - 1 ? "1" : "0"
            userAnswer.append(contentsOf: insertChar)
        }
    }
}

struct BinaryView_Previews: PreviewProvider {
    static var previews: some View {
        BinaryView()
    }
}
