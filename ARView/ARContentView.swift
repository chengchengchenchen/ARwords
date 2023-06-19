//
//  ContentView.swift
//  ARwords
//
//  Created by qjc on 2023/6/9.
//

import SwiftUI
import RealityKit

//var type = 1
var ind = 0

struct ARContentView : View {
    @Binding var wordBook: WordBookP
    
    @State var type = 1
    //var arViewContainer = ARViewController()
    @State var modelCount = 0 //声明一个@State变量来存储模型的数量
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack{
            VStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "chevron.left")
                }.padding()
                Spacer()
                Button(action: {
                    type = 1;
                }){
                    VStack{
                        // place another word
                        Image(systemName: "plus")
                            .foregroundColor(type == 1 ? .red : .blue)
                    }
                    
                }.padding()
                Button(action: {
                    type = 2;
                }){
                    VStack{
                        // mark memorized
                        Image(systemName: "checkmark")
                            .foregroundColor(type == 2 ? .red : .blue)
                    }
                    
                }.padding()
                Button(action: {type = 3}){
                    VStack{
                        // peek chinese meaning
                        Image(systemName: "eye")
                            .foregroundColor(type == 3 ? .red : .blue)
                    }
                    
                }.padding()
                Button(action: {type = 4}){
                    VStack{
                        // mark forgot
                        Image(systemName: "flag")
                            .foregroundColor(type == 4 ? .red : .blue)
                    }
                    
                }.padding()
                Spacer()
            }.background(.ultraThinMaterial)
            ARViewController(modelCount: $modelCount, type: $type, wordBook: $wordBook).edgesIgnoringSafeArea(.all)
        }
        .navigationBarBackButtonHidden()
    }
}

struct ARViewController: UIViewControllerRepresentable {
    @Binding var modelCount: Int
    @Binding var type: Int
    @Binding var wordBook: WordBookP
    //let viewController = ViewController(modelCount: $modelCount)
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        //
    }
    
    func makeUIViewController(context: Context) -> ViewController {
        //create a instance of ViewController
        let viewController = ViewController(modelCount: $modelCount, type: $type, wordBook: $wordBook)
        return viewController
    }
    
}

#if DEBUG
struct ARContentView_Previews : PreviewProvider {
    static var previews: some View {
        @State var WordBooks: [WordBookP] = JsonPersistence.loadWordBooks()
        ARContentView(wordBook: $WordBooks[0])
    }
}
#endif
