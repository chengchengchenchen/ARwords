//
//  MainUIView.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/11.
//

import SwiftUI

struct MainUIView: View {
    var items: [WordBookP]
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationView {
                List {
                    ForEach(items) { wordBook in
                        NavigationLink {
                            WordList(words: wordBook.words, name: wordBook.name)
                        } label: {
                            WordBookDisplay(wordBook: wordBook)
                        }
                        .padding(.leading)
                    }
                }
                .navigationTitle("选择单词本")
            }
        }
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var items: [WordBookP] = [WordBookP(id: 1, wordMemorized: 100, batchFinished: 10, batchLeft: 90, batchSize: 10, capacity: 1000, lastVisitTime: Date(), name: "测试单词本1", wordVisited: 300, words: [WordP(id: 1, english: "run", chinese: "v. 跑；运行", isMemorized: true), WordP(id: 2, english: "swim", chinese: "v. 游泳", isMemorized: false)]), WordBookP(id: 1, wordMemorized: 100, batchFinished: 10, batchLeft: 90, batchSize: 10, capacity: 1000, lastVisitTime: Date(), name: "测试单词本2", wordVisited: 300, words: [WordP(id: 1, english: "run", chinese: "v. 跑；运行", isMemorized: true), WordP(id: 2, english: "swim", chinese: "v. 游泳", isMemorized: false)])]
    
    static var previews: some View {
        MainUIView(items: items)
    }
}
