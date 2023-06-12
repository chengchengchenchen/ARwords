////
////  Words.swift
////  Backend
////
////  Created by Ihsiao Huang on 2023/6/10.
////
//
////  将数据库中的数据类型 WordP 做绑定
//import Foundation
//import SwiftData
//
//
//
//class WordManager {
//    var words: [WordP]
//    var batchSize: Int
//    var batch: [WordP]
//    
//    init(words: [WordP], batchSize: Int = 10) {
//        self.words = words
//        self.batchSize = batchSize
//        self.batch = []
//        
//        // Generate the initial batch
//        generateBatch()
//    }
//    
//    func generateBatch() {
//        // Clear the current batch
//        batch.removeAll()
//        
//        // Generate a new batch of random words
//        for _ in 0..<batchSize {
//            let index = Int.random(in: 0..<words.count)
//            let word = words[index]
//            batch.append(word)
//        }
//    }
//    
//    func getBatch() -> [WordP] {
//        return batch
//    }
//    
//    func memorized(wordIndex: Int) {
//        // Increment the memorized value of the word at the given index
//        let word = batch[wordIndex]
//        word.memorized += 1
//        
//        // Replace the word with a new random word
//        let index = Int.random(in: 0..<words.count)
//        let newWord = words[index]
//        batch[wordIndex] = newWord
//    }
//}
