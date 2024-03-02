import SwiftUI

struct BinaryTree: View {
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

                        Text("Binary Tree is a data structure defined as a hierarchical tree where each node can have at most two children, named the left and right child. Similar to a family tree, the top node is known as the root. This structure enables efficient operations such as searching, inserting, and deleting data.")
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
class BinaryTreeNode<T> {
    var value: T
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    init(_ value: T) {
        self.value = value
    }
}

struct BinaryTree<T> {
    var root: BinaryTreeNode<T>?

    init(_ rootValue: T) {
        self.root = BinaryTreeNode(rootValue)
    }
}

""")
                        .font(.system(size: 30, design: .monospaced))
                        .foregroundStyle(.gray)
                        .padding(.horizontal, 104)
                        .padding(.bottom, 20)
                    }
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Binary Tree")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}

struct BinaryTree_Previews: PreviewProvider {
    static var previews: some View {
        BinaryTree()
    }
}
