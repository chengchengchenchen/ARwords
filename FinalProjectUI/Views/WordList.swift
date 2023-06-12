//
//  WordList.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/9.
//

import SwiftUI

struct WordList: View {
    @State var words: [WordP]
    @State var isShowingEditWordView = false
    @State var isShowingAddWordView = false
    @State var isShowingActionSheet = false
    @State var isShowingAlert = false
    
    var name: String
    
    var body: some View {
            VStack {
                listView
                
                NavigationView {
                    HStack {
                        Button {
                            @State var tmpWord: WordP = WordP(id: words.count, english: "", chinese: "")
                            isShowingAddWordView.toggle()
                        } label: {
                            Text("添加单词")
                                .font(.title)
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .padding(.trailing)
                        .sheet(isPresented: $isShowingAddWordView, content: {
                            AddWordForm(words: $words)
                        })
                        Button {
                            
                        } label: {
                            Text("进入AR宫殿")
                                .font(.title)
                        }
                        .buttonStyle(BorderedButtonStyle())
                    }
                    .padding(.top)
                }
                .frame(height: 40)
                
            }
            .navigationTitle(name)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    var listView: some View {
        List{
            ForEach(Array(words.enumerated()), id: \.offset) { index, word in
                HStack{
                    WordRow(english: word.english, chinese: word.chinese)
                    .swipeActions(edge:.leading) {
                        // swipe left to edit word
                        //  navigate to EditWordView
                        Button("编辑") {
                            // set the state variable to show the alert
//                            isShowingAlert = true
                            isShowingActionSheet.toggle()
                        }
                        .tint(.blue)
//                                    .alert(isPresented: $isShowingAlert) {
//                                        Alert(title: Text("编辑"), message: Text("您确定要编辑此项吗?"), primaryButton: .default(Text("确定")), secondaryButton: .cancel())
//                                    }
                        Button("删除") {
                            // delete the selected WordP object
                            words.remove(at: index)
                        }
                        .tint(.red)
                        if (word.isMemorized) {
                            Button("标为未背") {
                                // set word's isMemorized to false
                                words[index].isMemorized = false
                            }
                            .tint(.secondary)
                        } else {
                            Button("标为已背") {
                                // set word's isMemorized to true
                                words[index].isMemorized = true
                                
                            }
                            .tint(.green)
                        }
                    }
                    
                    Spacer()
                    //
//                                Button($words[index].isMemorized.wrappedValue ? "忘了？" : "会啦！"){
//                                    words[index].isMemorized.toggle()
//                                }
//                                .foregroundColor(.white)
                Button("编辑"){
//                    isShowingEditWordView.toggle()
//                    isShowingActionSheet.toggle()
                    print(isShowingEditWordView)
                }
//                                Toggle(isOn: $words[index].isMemorized) {
//                                    Text("已背")
//                                }
//
//                            .alert(isPresented: $isShowingAlert) {
//                                Alert(title: Text("编辑"), message: Text("您确定要编辑此项吗？"), primaryButton: .default(Text("确定")), secondaryButton: .cancel())
//                            }
                .sheet(isPresented: $isShowingActionSheet, content: {
                    EditWordView(english: $words[index].english, chinese: $words[index].chinese, isShowing: $isShowingActionSheet)
                })
                .hidden()
            }
                .listRowBackground(word.isMemorized ? Color.green : Color.secondary)
            }
        }
    }
}

struct WordList_Previews: PreviewProvider {
    static let words = [WordP(id: 1, english: "run", chinese: "v. 跑；运行", isMemorized: true), WordP(id: 2, english: "swim", chinese: "v. 游泳", isMemorized: false)]
    
    static var previews: some View {
        WordList(words: words, name: "测试单词本1")
    }
}
