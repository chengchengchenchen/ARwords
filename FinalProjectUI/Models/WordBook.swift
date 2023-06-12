//
//  WordBook.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/10.
//

import Foundation

struct WordBookP: Identifiable {
    
    var id: Int
    var wordMemorized: Int64
    var batchFinished: Int64
    var batchLeft: Int64
    var batchSize: Int64
    var capacity: Int64
    var lastVisitTime: Date
    var name: String
    var wordVisited: Int64
    var words: [WordP]

}
