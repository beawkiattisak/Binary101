import SwiftUI

struct FourthTutorial: View {
    @State private var answer1: String = "0"
    @State private var answer2: String = "0"

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Tutorial")
                    .font(.system(size: 80, design: .monospaced))
                Text("( 1 + 1 = 10 )")
                    .font(.system(size: 60, design: .monospaced))
                    .bold()
                Text("with a carry of 1 to the next column")
                    .font(.system(size: 30, design: .monospaced))
                    .bold()
            }
            .padding(.top, 40)
            VStack(spacing: 20) {
                VStack(alignment: .trailing) {
                    HStack {
                        VStack {
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                .overlay(
                                    Text("0")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 75, design: .monospaced))
                                )
                        }
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .cornerRadius(15)
                            .overlay(
                                Text("1")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 75, design: .monospaced))
                            )
                    }
                    HStack(alignment: .top) {
                        
                        Rectangle()
                            .frame(width: 150, height: 150)
                            .cornerRadius(15)
                            .overlay(
                                Text("1")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 75, design: .monospaced))
                            )
                    }
                }

                HStack {
                    Rectangle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 5)
                                .overlay(
                                    Text(answer1)
                                        .foregroundColor(.black)
                                        .font(.system(size: 75, design: .monospaced))
                                        .onTapGesture {
                                            withAnimation {
                                                toggleAnswer1()
                                            }
                                        }
                                        .contentShape(Rectangle())
                                )
                        )
                        .onTapGesture {
                            withAnimation {
                                toggleAnswer1()
                            }
                        }

                    Rectangle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 5)
                                .overlay(
                                    Text(answer2)
                                        .foregroundColor(.black)
                                        .font(.system(size: 75, design: .monospaced))
                                        .onTapGesture {
                                            withAnimation {
                                                toggleAnswer2()
                                            }
                                        }
                                        .contentShape(Rectangle())
                                )
                        )
                        .onTapGesture {
                            withAnimation {
                                toggleAnswer2()
                            }
                        }
                }
                .padding(.top, 20)
            }
            .padding(.top, 30)
            VStack {
                NavigationLink(
                    destination: Home(),
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(maxWidth: .infinity, maxHeight: 80)
                                .foregroundColor(answer1 == "1" && answer2 == "0" ? Color.black : Color.gray)
                                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)

                            HStack {
                                Text("Done")
                                    .font(.system(size: 30, design: .monospaced))
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            HStack {
                                Spacer()
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.white)
                                    .padding()
                                    .font(.system(size: 40))
                            }
                        }
                    }
                )
                .padding(.top, 160)
                .disabled(!(answer1 == "1" && answer2 == "0"))
                .opacity(100)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.light)
        .padding()
    }

    private func toggleAnswer1() {
        answer1 = (answer1 == "0") ? "1" : "0"
    }

    private func toggleAnswer2() {
        answer2 = (answer2 == "0") ? "1" : "0"
    }
}

struct FourthTutorial_Previews: PreviewProvider {
    static var previews: some View {
        FourthTutorial()
    }
}

