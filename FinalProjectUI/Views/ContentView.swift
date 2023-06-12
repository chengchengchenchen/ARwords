//
//  ContentView.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
         MainUIView(items: [WordBookP(id: 1, wordMemorized: 100, batchFinished: 10, batchLeft: 90, batchSize: 10, capacity: 1000, lastVisitTime: Date(), name: "测试单词本1", wordVisited: 300, words: [WordP(id: 1, english: "run", chinese: "v. 跑；运行", isMemorized: true), WordP(id: 2, english: "swim", chinese: "v. 游泳", isMemorized: false)]), WordBookP(id: 1, wordMemorized: 100, batchFinished: 10, batchLeft: 90, batchSize: 10, capacity: 1000, lastVisitTime: Date(), name: "测试单词本2", wordVisited: 300, words: [WordP(id: 1, english: "run", chinese: "v. 跑；运行", isMemorized: true), WordP(id: 2, english: "swim", chinese: "v. 游泳", isMemorized: false)])])
//        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
