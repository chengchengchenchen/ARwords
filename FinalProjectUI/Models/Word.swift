//
//  Word.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/9.
//

import Foundation

struct WordP: Identifiable {
    var id: Int
    var english: String
    var chinese: String
    var isMemorized: Bool = false
    var isVisited: Bool = false
}
