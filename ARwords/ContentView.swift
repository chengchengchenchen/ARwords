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

struct ContentView : View {
    @State var type = 1
    //var arViewContainer = ARViewController()
    @State var modelCount = 0 //声明一个@State变量来存储模型的数量
    
    var body: some View {
        HStack{
            VStack{
                Button(action: {
                    //退出逻辑写在这
                }){
                    Image(systemName: "chevron.left")
                }.padding()
                Spacer()
                Button(action: {
                    type = 1;
                }){
                    VStack{
                        //Text("add")
                        Image(systemName: "plus")
                            .foregroundColor(type == 1 ? .red : .blue)
                    }
                    
                }.padding()
                Button(action: {
                    type = 2;
                }){
                    VStack{
                        //Text("add")
                        Image(systemName: "checkmark")
                            .foregroundColor(type == 2 ? .red : .blue)
                    }
                    
                }.padding()
                Button(action: {type = 3}){
                    VStack{
                        //Text("show")
                        Image(systemName: "eye")
                            .foregroundColor(type == 3 ? .red : .blue)
                    }
                    
                }.padding()
                Button(action: {type = 4}){
                    VStack{
                        //Text("label")
                        Image(systemName: "flag")
                            .foregroundColor(type == 4 ? .red : .blue)
                    }
                    
                }.padding()
                Spacer()
            }.background(.ultraThinMaterial)
            ARViewController(modelCount: $modelCount,type: $type).edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct ARViewController: UIViewControllerRepresentable {
    
    @Binding var modelCount: Int
    @Binding var type: Int
    //let viewController = ViewController(modelCount: $modelCount)
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        //
    }
    
    func makeUIViewController(context: Context) -> ViewController {
        //create a instance of ViewController
        let viewController = ViewController(modelCount: $modelCount,type: $type)
        return viewController
    }
    
}

//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
