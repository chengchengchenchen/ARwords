//
//  word.swift
//  ARwords
//
//  Created by qjc on 2023/6/9.
//

import Foundation
struct Word{
    var Eng:String
    var Cn:String
    var t:Int
    var isLabeled:Bool
    var isDeleted:Bool
    init(Eng: String, Cn: String, t: Int) {
        self.Eng = Eng
        self.Cn = Cn
        self.t = t
        self.isLabeled = false
        self.isDeleted = false
    }
}

let wordType = ["","v.", "n.", "adj."]
let words: [Word] = [
    Word(Eng: "run", Cn: "跑", t: 1),
    Word(Eng: "book", Cn: "书", t: 2),
    Word(Eng: "happy", Cn: "快乐", t: 3),
    Word(Eng: "eat", Cn: "吃", t: 1),
    Word(Eng: "dog", Cn: "狗", t: 2),
    Word(Eng: "big", Cn: "大", t: 3),
    Word(Eng: "write", Cn: "写", t: 1),
    Word(Eng: "pen", Cn: "笔", t: 2),
    Word(Eng: "red", Cn: "红色", t: 3),
    Word(Eng: "sing", Cn: "唱歌", t: 1),
    Word(Eng: "flower", Cn: "花", t: 2),
    Word(Eng: "beautiful", Cn: "美丽", t: 3),
    Word(Eng: "read", Cn: "阅读", t: 1),
    Word(Eng: "car", Cn: "汽车", t: 2),
    Word(Eng: "fast", Cn: "快速", t: 3),
    Word(Eng: "play", Cn: "玩耍", t: 1),
    Word(Eng: "ball", Cn: "球", t: 2),
    Word(Eng: "small", Cn: "小", t: 3),
    Word(Eng: "sleep", Cn: "睡觉", t: 1),
    Word(Eng: "cat", Cn: "猫", t: 2)
]
