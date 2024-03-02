import SwiftUI

struct Algorithm: View {
    var body: some View {
        TabView {
            BinarySearch()
                .tabItem {
                    Label("Binary Search", systemImage: "magnifyingglass")
                }

            BinaryTree()
                .tabItem {
                    Label("Binary Tree", systemImage: "tree.fill")
                }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
            .preferredColorScheme(.light)
    }
}

struct Algorithm_Previews: PreviewProvider {
    static var previews: some View {
        Algorithm()
    }
}
