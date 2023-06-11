//
//  ContentView.swift
//  ARwords
//
//  Created by qjc on 2023/6/9.
//

import SwiftUI
import RealityKit

var type = 1
var ind = 0

struct ContentView : View {
    var arViewContainer = ARViewController()
    var body: some View {
        
        HStack{
            
            
            VStack{
                
                Button(action: {
                    //退出逻辑写在这
                    //type=1
                    
                }){
                    Image(systemName: "chevron.left")
                }.padding()
                Spacer()
                Button(action: {type = 1}){
                    VStack{
                        //Text("add")
                        Image(systemName: "plus")
                    }
                    
                }.padding()
                Button(action: {type = 2}){
                    VStack{
                        //Text("add")
                        Image(systemName: "checkmark")
                    }
                    
                }.padding()
                Button(action: {type = 3}){
                    VStack{
                        //Text("show")
                        Image(systemName: "eye")
                    }
                    
                }.padding()
                Button(action: {type = 4}){
                    VStack{
                        //Text("label")
                        Image(systemName: "flag")
                    }
                    
                }.padding()
                Spacer()
            }.background(.ultraThinMaterial)
            ARViewController().edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct ARViewController: UIViewControllerRepresentable {
    let viewController = ViewController()
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        //
    }
    
    func makeUIViewController(context: Context) -> ViewController {
        //create a instance of ViewController
        
        return viewController
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
