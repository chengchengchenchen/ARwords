//
//  WordBookDisplay.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/10.
//

import SwiftUI

struct WordBookDisplay: View {
    var wordBook: WordBookP
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Image(systemName: "book.closed")
                        .resizable()
                        .frame(width: 120, height: 175)
                        .foregroundColor(Color(red: 0.476841867, green: 0.5048075914, blue: 1))
                        .padding(.leading)
                }
                .padding(.top)
                 Spacer()
                VStack(alignment: .trailing) {
                    Text("\(wordBook.name)")
                        .padding(.bottom)
                        .font(.title)
                        .truncationMode(.tail)
                    Text("总单词数：\(wordBook.capacity)")
                    Text("已背：\(wordBook.wordMemorized)")
                    Text("已看：\(wordBook.wordVisited)")
                }
                .padding(.trailing)
                
            }
            
            PieChart(charDataObj: ChartDataContainer(memorized: wordBook.wordMemorized, visited: wordBook.wordVisited, capacity: wordBook.capacity))
                
        }
//        .frame(width: 330, height: 620)
        // set the background to some color that matches all other components
        .background(Color(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882))
        .cornerRadius(10)
        .shadow(radius: 5)
        // set the foreground to some color that matches the background
        .foregroundColor(.black)
    }
}

struct WordBookDisplay_Previews: PreviewProvider {
    static var wordBook: WordBookP = WordBookP(id: 1, wordMemorized: 100, batchFinished: 10, batchLeft: 90, batchSize: 10, capacity: 1000, lastVisitTime: Date(), name: "测试单词本", wordVisited: 300, words: [])
    static var previews: some View {
        WordBookDisplay(wordBook: wordBook)
    }
}
