//
//  JsonPersistence.swift
//  FinalProjectUI
//
//  Created by Ihsiao Huang on 2023/6/17.
//

import Foundation

class JsonPersistence {
    
//    static let sharedInstance = JsonPersistence()
//    
//    static var documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    
//    static var fileURL = documentsDirectory.appendingPathComponent("data.json")
    
//    // 保存数据到文件
//    let data = "Hello, World!"
//    try data.write(to: fileURL, atomically: true, encoding: .utf8)
//
//    // 从文件读取数据
//    let loadedData = try String(contentsOf: fileURL)
//    print(loadedData) // 输出 "Hello, World!"
    
    static func storeWordBooks (object: [WordBookP]) {
        var newWriteRes = ["data": ""]
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let encodeString = String(data: try! encoder.encode(object), encoding: .utf8)!
        newWriteRes["data"] = encodeString
        print(newWriteRes)
        HzzzJSON.JsonWrite(filename: "data.json", data: newWriteRes)
    }
    
    static func loadWordBooks () -> [WordBookP] {
        let newReadRes = HzzzJSON.JsonRead(filename: "data.json")
        let decoder = JSONDecoder()
        let newWords = try! decoder.decode([WordBookP].self, from: newReadRes["data"]?.data(using: .utf8) ?? Data())
        return newWords
//        let data = try Data(contentsOf: url)
//        let decoder = JSONDecoder()
//        return try decoder.decode(type, from: data)
    }
    
    
    
}
