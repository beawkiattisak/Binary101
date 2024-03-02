import SwiftUI

struct BinaryAddTutorial: View {
    var body: some View {
        NavigationView {
            FirstTutorial()
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.light)
    }
}

struct BinaryAddTutorial_Previews: PreviewProvider {
    static var previews: some View {
        BinaryAddTutorial()
    }
}
