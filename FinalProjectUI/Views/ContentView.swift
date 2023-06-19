//
//  ContentView.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/9.
//

import SwiftUI

struct ContentView: View {
    @State var WordBooks: [WordBookP]
    init(){
        WordBooks = JsonPersistence.loadWordBooks()
    }

        @State private var isActive: Bool = false
        
        var body: some View {
            VStack {
                if self.isActive {
                    MainUIView(items: $WordBooks)
                } else {
                    SplashScreen()
                }
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            .onChange(of: WordBooks) { NewValues in
                JsonPersistence.storeWordBooks(object: NewValues)
            }
        }
    }

    struct SplashScreen: View {
        @State private var animate = false
        let circleSize: CGFloat = 60
        let circlePadding: CGFloat = 20
        
        var body: some View {
            VStack {
                ZStack {
                    Color(.systemBackground)
                        .edgesIgnoringSafeArea(.all)
                    Text("AR Words")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .offset(y: 50)
                    
                    Circle()
                        .fill(Color(red: 1, green: 0.4932718873, blue: 0.4739984274))
                        .frame(width: circleSize, height: circleSize)
                        .scaleEffect(animate ? 1 : 0)
                        .offset(x: (circleSize + circlePadding) * (-1))
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                    
                    Circle()
                        .fill(Color(red: 1, green: 0.8323456645, blue: 0.4732058644))
                        .frame(width: circleSize, height: circleSize)
                        .scaleEffect(animate ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(0.2))
                    
                    Circle()
                        .fill(Color(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315))
                        .frame(width: circleSize, height: circleSize)
                        .scaleEffect(animate ? 1 : 0)
                        .offset(x: circleSize + circlePadding)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(0.4))
                }
                .onAppear {
                    self.animate.toggle()
                }
                
                Text("©2023\nqjc, macrofox & Ihsiao")
                    .font(.headline)
                    .bold()
                    .offset(y: -50)
            }
        }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
