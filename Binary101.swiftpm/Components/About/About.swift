import SwiftUI

struct About: View {
    var body: some View {
        VStack {
            VStack {
                Text("About this app")
                    .font(.system(size: 80))
                    .bold()
                    .padding(.top)
                    .italic()
                    .padding(.bottom, 30)
                Text("The basis of learning computer science is binary, so this app was created to teach basic binary addition. and binary to text converter function, which has little algorithm details and sample code.")
                    .font(.system(size: 30, design: .monospaced))
                    .multilineTextAlignment(.center)
                Text("Developer")
                    .font(.system(size: 80))
                    .bold()
                    .padding(.top)
                    .italic()
                    .padding(.bottom, 30)
                Text("Hello! I'm Kiattisak, 16 years old from Thailand. I love coding, and this is my second attempt at the WWDC Swift Student Challenge.")
                    .font(.system(size: 30, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                Spacer()
                
                Text("Have fun learning!")
                    .font(.system(size: 40, design: .monospaced))
                
            }
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    About()
}
