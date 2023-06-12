//
//  ChartData.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/10.
//

import Foundation
import SwiftUI

struct ChartData {
    var id = UUID()
    var color: Color
    var percent: CGFloat
    var value: CGFloat
    var label: String
}

class ChartDataContainer {
    @Published var charData: [ChartData]
    
    init(memorized: Int64, visited: Int64, capacity: Int64) {
        charData = [
            ChartData(
                color: Color(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315),
                percent: CGFloat(memorized) / CGFloat(capacity) * 100,
                value: 0,
                label: "已背"
            ),
            ChartData(
                color: Color(red: 1, green: 0.8323456645, blue: 0.4732058644),
                percent: CGFloat((visited - memorized)) / CGFloat(capacity) * 100,
                value: 0,
                label: "已看"
            ),
            ChartData(
                color: Color(red: 1, green: 0.4932718873, blue: 0.4739984274),
                percent: (1 - CGFloat(visited) / CGFloat(capacity)) * 100,
                value: 0,
                label: "未看"
            )
        ]
        calc()
    }
    
    func calc() {
        var value : CGFloat = 0
        
        for i in 0..<charData.count {
            value += charData[i].percent
            charData[i].value = value
        }
    }
}
