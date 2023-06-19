//
//  Word.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/9.
//

import Foundation

struct WordP: Identifiable, Codable, Equatable {
    var id: Int
    var english: String
    var chinese: String
    var isMemorized: Bool = false
    var isVisited: Bool = false
}

//// add the function to wrap the WordP object to json
//extension WordP: Encodable {
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(english, forKey: .english)
//        try container.encode(chinese, forKey: .chinese)
//        try container.encode(isMemorized, forKey: .isMemorized)
//        try container.encode(isVisited, forKey: .isVisited)
//    }
//}

