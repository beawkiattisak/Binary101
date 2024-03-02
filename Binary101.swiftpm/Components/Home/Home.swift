import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 20) {
                    Text("Welcome to")
                        .font(.system(size: 50, design: .monospaced))
                    Text("Binary101!")
                        .font(.system(size: 80, design: .monospaced))
                        .foregroundColor(.black)
                        .bold()
                    Text("Let's explore binary")
                        .font(.system(size: 45, design: .monospaced))
                }
                .padding(.top, 50)
                .padding(.bottom, 50)
                
                NavigationLink(destination: BinaryAddTutorial()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: 120)                            .foregroundColor(Color(hex: "#18181b"))
                            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                        
                        HStack {
                            Text("Tutorial (Add)")
                                .font(.system(size: 35, design: .monospaced))
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 10)
                            
                            Spacer()
                            
                            Image(systemName: "book.pages")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .padding()
                                .bold()
                        }
                        .padding()
                    }
                    .foregroundColor(.white)
                    
                }
                
                
                NavigationLink(destination: BinaryView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: 120)                            .foregroundColor(Color(hex: "#18181b"))
                            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                        
                        HStack {
                            Text("Binary Addition")
                                .font(.system(size: 35, design: .monospaced))
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 10)
                            
                            Spacer()
                            
                            Image(systemName: "arrow.forward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .padding()
                                .bold()
                        }
                        .padding()
                    }
                    .foregroundColor(.white)
                    .padding(.top, 5)
                }
                
                
                
                NavigationLink(destination: Converter())
                {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: 120)                             .foregroundColor(Color(hex: "#18181b"))
                            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                        
                        HStack {
                            Text("Converter")
                                .font(.system(size: 35, design: .monospaced))
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 10)
                            
                            Spacer()
                            
                            Image(systemName: "arrow.left.arrow.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .padding()
                                .bold()
                        }
                        .padding()
                    }
                    .foregroundColor(.white)
                    .padding(.top, 5)
                    
                }
                
                NavigationLink(destination: Algorithm()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: 120)                            .foregroundColor(Color(hex: "#18181b"))
                            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                        
                        HStack {
                            Text("Algorithm Vault")
                                .font(.system(size: 35, design: .monospaced))
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 10)
                            
                            Spacer()
                            
                            Image(systemName: "point.3.filled.connected.trianglepath.dotted")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .padding()
                                .bold()
                        }
                        .padding()
                    }
                    .padding(.top, 5)
                    .foregroundColor(.white)
                    
                }
                
                
                Spacer()
                NavigationLink(destination: About()) {
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                    Text("about this application")
                        .foregroundColor(.gray)
                        .font(.system(size: 30))
                }
                .padding(.bottom, 60)
            }
            .padding(.horizontal, 20)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
