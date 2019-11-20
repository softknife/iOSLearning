//
//  CalculatorView.swift
//  Calculator
//
//  Created by Reed on 2019/11/20.
//  Copyright © 2019 Reed. All rights reserved.
//

import SwiftUI


/*
 ForEach:
 “ForEach 是 SwiftUI 中一个用来列举元素，并生成对应 View collection 的类型。它接受一个数组，且数组中的元素需要满足 Identifiable 协议。如果数组元素不满足 Identifiable，我们可以使用 ForEach(_:id:) 来通过某个支持 Hashable 的 key path 获取一个等效的元素是 Identifiable 的数组。”

 Spacer:
 “SwiftUI 允许我们定义可伸缩的空白：Spacer，它会尝试将可占据的空间全部填满。”

 */
struct CalculatorView: View {
    
    let scale: CGFloat = UIScreen.main.bounds.width / 414

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0123223")
                .font(.system(size:76))
                .minimumScaleFactor(0.5)
                .padding(.trailing,24)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            
            CalculatorButtonPad()
                .padding(.bottom)
        }
        .scaleEffect(scale)
        // “最简单粗暴的做法，是把整个界面进行缩放。View 提供了 .scaleEffect modifier 来进行缩放。”
 
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        
        /*
         通过这个group,可以预览多个模拟器
         */
        Group{
            CalculatorView()
            CalculatorView().previewDevice("iPhone SE")
        }
    }
}


/// 整体组成一个View
struct CalculatorButtonPad:View {
    let pad:[[CalculatorButtonItem]] = [
        [.command(.clear),.command(.flip),.command(.percent),.op(.divide)],
        [.digit(7),.digit(8),.digit(9),.op(.multiply)],
        [ .digit(4),.digit(5),.digit(6),.op(.minus)],
        [ .digit(1),.digit(2),.digit(3),.op(.plus)],
        [.digit(0),.dot,.op(.equal)]
    ]
    
    var body: some View {
        VStack( spacing: 8){
            ForEach(pad,id:\.self){ row in
                CalculatorButtonRow(row: row)
            }
        }
    }

}


/// 一行组成一个View
struct CalculatorButtonRow:View {
    
    let row:[CalculatorButtonItem]
    var body: some View {
        HStack{
            ForEach(row,id: \.self){ item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    print("Button:\(item.title)")
                }
            }
        }
    }

}
