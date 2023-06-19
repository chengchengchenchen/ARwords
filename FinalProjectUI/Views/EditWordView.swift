//
//  EditWordView.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/12.
//

import SwiftUI

struct EditWordView: View {
    @Binding var english: String
    @Binding var chinese: String
    @Binding var isShowing: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("编辑英文")) {
                TextField("english", text: $english)
            }
            
            Section(header: Text("编辑中文释义")) {
                TextField("中文", text: $chinese)
            }
            
            Button {
                // TODO
//                presentationMode.wrappedValue.dismiss()
                isShowing = false
            } label: {
                Text("保存修改")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

//struct EditWordView_Previews: PreviewProvider {
//    @State static var english = ""
//    @State static var chinese = ""
//    
//    static var previews: some View {
//        EditWordView(english: $english, chinese: $chinese)
//    }
//}
