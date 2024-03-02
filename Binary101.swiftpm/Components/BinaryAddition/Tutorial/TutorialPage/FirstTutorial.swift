import SwiftUI

struct FirstTutorial: View {
    @State private var answer: String = "1"

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Tutorial")
                    .font(.system(size: 80, design: .monospaced))
                Text("( 0 + 0 = 0 )")
                    .font(.system(size: 60, design: .monospaced))
                    .bold()
            }
            .padding(.top, 40)
            VStack(spacing: 20) {
                Rectangle()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .overlay(
                        Text("0")
                            .foregroundStyle(.white)
                            .font(.system(size: 75, design: .monospaced))
                    )
                Rectangle()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .overlay(
                        Text("0")
                            .foregroundStyle(.white)
                            .font(.system(size: 75, design: .monospaced))
                    )
                Rectangle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 5)
                            .overlay(
                                Text(answer)
                                    .foregroundColor(.black)
                                    .font(.system(size: 75, design: .monospaced))
                                    .onTapGesture {
                                        withAnimation {
                                            toggleAnswer()
                                        }
                                    }
                                    .contentShape(Rectangle())
                            )
                    )
                    .onTapGesture {
                        withAnimation {
                            toggleAnswer()
                        }
                    }
                    .padding(.top, 20)
                VStack {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 50))
                    Text("(Tap this button)")
                        .font(.system(size: 40, design: .monospaced))
                        .padding(.top, 10)
                }
            }
            .padding(.top, 20)
            VStack {
                NavigationLink(
                    destination: SecondTutorial(),
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(maxWidth: .infinity, maxHeight: 80)
                                .foregroundColor(answer == "0" ? Color.black : Color.gray)
                                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)

                            HStack {
                                Text("Next")
                                    .font(.system(size:30, design: .monospaced))
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(.white)
                                    .padding()
                                    .font(.system(size: 40))
                            }
                        }
                    }
                )
                .padding(.top, 40)
                .disabled(answer != "0")
                .opacity(100)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.light)
        
    }
    

    private func toggleAnswer() {
        answer = (answer == "0") ? "1" : "0"
    }
}

