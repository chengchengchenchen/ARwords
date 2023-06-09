//
//  AddWordForm.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/12.
//

import SwiftUI

struct AddWordForm: View {
    @State var english = ""
    @State var chinese = ""
    @State var isMemorized = false
    @Binding var wordBook: WordBookP
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("编辑英文")) {
                TextField("english", text: $english)
            }
            
            Section(header: Text("编辑中文释义")) {
                TextField("中文", text: $chinese)
            }
            
            Section(header: Text("是否掌握")) {
                Toggle(isOn: $isMemorized) {
                    Text("是否掌握")
                }
            }
            
            Button {
                wordBook.words.append(WordP(id: UUID().hashValue, english: english, chinese: chinese, isMemorized: isMemorized))
                wordBook.capacity += 1
                wordBook.wordMemorized += (isMemorized == true ? 1: 0)
                wordBook.wordVisited += (isMemorized == true ? 1: 0)
                 presentationMode.wrappedValue.dismiss()
            } label: {
                Text("添加")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            Button {
                 presentationMode.wrappedValue.dismiss()
            } label: {
                Text("取消")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

//struct AddWordForm_Previews: PreviewProvider {
//    @State static var words = [WordP(id: 1, english: "run", chinese: "v. 跑；运行", isMemorized: true), WordP(id: 2, english: "swim", chinese: "v. 游泳", isMemorized: false)]
//    
//    static var previews: some View {
//        AddWordForm(wordBook: $wordbook)
//    }
//}
