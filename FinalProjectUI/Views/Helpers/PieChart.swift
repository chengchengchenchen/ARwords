//
//  PieChart.swift
//  FinalProjectUI
//
//  Created by macrofox on 2023/6/10.
//

import SwiftUI

struct PieChart: View {
    var charDataObj: ChartDataContainer
    @State var indexOfTappedSlice = -1
    
    var body: some View {
        VStack {
            ZStack {
                chartView
                // “进入”的黑色文本标注
                Text("进入!")
//                    .font(.title)
                    .font(.bold(.title)())
                    .foregroundColor(.black)
            }.frame(width: 200, height: 250)
                .padding()
                .onAppear() {
                    self.charDataObj.calc()
                }
            
            statisticView
        }
            
        
    }
    
    var chartView: some View {
        ForEach(0..<charDataObj.charData.count) {index in
            Circle()
                .trim(from: index == 0 ? 0.0 : charDataObj.charData[index-1].value / 100, to: charDataObj.charData[index].value / 100)
                .stroke(charDataObj.charData[index].color, lineWidth: 50)
                .onTapGesture {
                    indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                }
                .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                .animation(.spring())
        }
    }
    
    var statisticView: some View {
        ForEach(0..<charDataObj.charData.count) { index in
            HStack {
                if index == indexOfTappedSlice {
                    Text(String(format: "%.2f", charDataObj.charData[index].percent) + "% " + charDataObj.charData[index].label)
                        .onTapGesture{
                            indexOfTappedSlice = -1
                        }
                .font( .headline )
                RoundedRectangle(cornerRadius: 8)
                    .fill(charDataObj.charData[index].color)
                    .frame(width: 15, height: 15)
            } else {
                Text(String(format: "%.2f", charDataObj.charData[index].percent) + "% " + charDataObj.charData[index].label)
                    .onTapGesture{
                        indexOfTappedSlice = index
                    }
            .font(.subheadline)
            RoundedRectangle(cornerRadius: 8)
                .fill(charDataObj.charData[index].color)
                .frame(width: 15, height: 15)
            }
        }
    }
    .padding(8)
    .frame(width: 300, alignment: .trailing)
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart(charDataObj: ChartDataContainer(memorized: 100, visited: 300, capacity: 1000))
    }
}
