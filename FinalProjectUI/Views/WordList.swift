//
//  WordList.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/9.
//

import SwiftUI

struct WordList: View {
    @Binding var wordBook: WordBookP
    @State var isShowingEditWordView = false
    @State var isShowingAddWordView = false
    @State var isShowingActionSheet = false
    @State var isShowingAlert = false
    @State var isShowArView = false
    
    var name: String
    @State var editThis: EditWordView = EditWordView(english: .constant(""), chinese: .constant(""), isShowing: .constant(false))
    
    
    var body: some View {

            VStack {
                listView
                Spacer()

                    HStack {
                        Button {
                            @State var tmpWord: WordP = WordP(id: wordBook.words.count, english: "", chinese: "")
                            isShowingAddWordView.toggle()
                        } label: {
                            Text("添加单词")
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .padding(.trailing)
                        .sheet(isPresented: $isShowingAddWordView, content: {
                            AddWordForm(wordBook: $wordBook)
                        })

                        NavigationLink(destination: ARContentView(wordBook: $wordBook)) {
                            Text("AR them!")
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .padding(.trailing)
//                        .navigationBarHidden(true)
                    }
                    .padding(.top)
                }
    }
    
    var listView: some View {
        List{
            ForEach(Array(wordBook.words.enumerated()), id: \.offset) { index, word in
                HStack{
                    WordRow(english: word.english, chinese: word.chinese)
                    .swipeActions(edge:.leading) {
                        // swipe left to delete or mark forgot
                        Button("编辑") {
                            isShowingActionSheet = true
                            print(isShowingActionSheet)
                            print(index)
                            editThis = EditWordView(
                                english: $wordBook.words[index].english,
                                chinese: $wordBook.words[index].chinese,
                                isShowing: $isShowingActionSheet)
                        }
                        .tint(.blue)
                        Button("删除") {
                            // delete the selected WordP object
                            if (wordBook.words[index].isMemorized) {
                                wordBook.wordMemorized -= 1
                            }
                            if (wordBook.words[index].isVisited) {
                                wordBook.wordVisited -= 1
                            }
                            wordBook.capacity -= 1
                            wordBook.words.remove(at: index)
//                            JsonPersistence.storeWordBooks(object: WordBooks)
                        }
                        .tint(.red)
                        if (word.isMemorized) {
                            Button("标为未背") {
                                // set word's isMemorized to false
                                wordBook.words[index].isMemorized = false
                                wordBook.wordMemorized -= 1
                            }
                            .tint(.secondary)
                        } else {
                            Button("标为已背") {
                                // set word's isMemorized to true
                                wordBook.words[index].isMemorized = true
                                wordBook.wordMemorized += 1
                                if (wordBook.words[index].isVisited == false) {
                                    wordBook.words[index].isVisited = true
                                    wordBook.wordVisited += 1
                                }
                            }
                            .tint(.green)
                        }
                    }
                    
                    Spacer()
                    //  navigate to EditWordView
                    Button("编辑"){
                    }
                    .sheet(isPresented: $isShowingActionSheet, content: {editThis})
                    .hidden()
                    //
//                                Button($wordBook.words[index].isMemorized.wrappedValue ? "忘了？" : "会啦！"){
//                                    wordBook.words[index].isMemorized.toggle()
//                                }
//                                .foregroundColor(.white)
            }
                .listRowBackground(word.isMemorized ? Color.green : Color.secondary)
            }
//            .onDelete(perform: deleteItem)
        }
    }
    
//    func deleteItem(at offsets: IndexSet) {
//        if wordBook.words.index(atOffsets: offsets)
//        wordBook.words.remove(atOffsets: offsets)
//    }
//
//    func addItem() {
//        wordBook.words.append(newItem)
//        newItem = ""
//    }
}

struct WordList_Previews: PreviewProvider {
    @State static var wordBook = WordBookP(id: 1, wordMemorized: 100, batchFinished: 10, batchLeft: 90, batchSize: 10, capacity: 1000, lastVisitTime: Date(), name: "测试单词本1", wordVisited: 300,
                                    words: [WordP(id: 1, english: "run", chinese: "v. 跑；运行", isMemorized: true),
                                            WordP(id: 2, english: "swim", chinese: "v. 游泳", isMemorized: false)])
    
    static var previews: some View {
        WordList(wordBook: $wordBook, name: "测试单词本1")
    }
}
