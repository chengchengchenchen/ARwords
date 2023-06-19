//
//  WrodRow.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/9.
//

import SwiftUI

struct WordRow: View {
    var english: String
    var chinese: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(english)")
            Text("\(chinese)")
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}

struct WordRow_Previews: PreviewProvider {
    static var previews: some View {
        WordRow(english: "run", chinese: "v. 跑；运行")
    }
}
