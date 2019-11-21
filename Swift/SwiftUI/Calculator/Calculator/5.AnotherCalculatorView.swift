//
//  5.AnotherCalculatorView.swift
//  Calculator
//
//  Created by Reed on 2019/11/21.
//  Copyright © 2019 Reed. All rights reserved.
//

import SwiftUI

struct AnotherCalculatorView: View {

    var body: some View {
        VStack(spacing: 12) {

            HStack{
                Spacer()
                VStack{
                    Spacer()
                    Text("0123")
                    .font(.system(size:76))
                    .minimumScaleFactor(0.5)
                    .padding(.trailing,24)
                    .lineLimit(1)
                }
            }
            .frame(minHeight: 0, maxHeight: .infinity, alignment: .trailing)
            
            AnotherCalculatorButtonPad()
                .padding(.bottom)
        }
        
    }
}

struct AnotherCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            AnotherCalculatorView()
//                .environment(\.colorScheme, .dark)
            AnotherCalculatorView().previewDevice("iPhone SE")
            AnotherCalculatorView().previewDevice("iPad Air 2")
        }
    }
}


/// 整体组成一个View
struct AnotherCalculatorButtonPad:View {
    
    let pad:[[CalculatorButtonItem]] = [
        [.command(.clear),.digit(7),.digit(4),.digit(1),.digit(0)],
        [.command(.flip),.digit(8) ,.digit(5), .digit(2)],
        [.command(.percent),.digit(9),.digit(6),.digit(3),.dot],
        [.op(.divide),.op(.multiply),.op(.minus),.op(.plus),.op(.equal)]
    ]
    

    
    var body: some View {

        HStack(alignment: .firstTextBaseline){
            ForEach(pad,id:\.self){ row in
                AnotherCalculatorButtonRow(row: row)
            }
        }
    }

}


/// 一行组成一个View
struct AnotherCalculatorButtonRow:View {
    

    let row:[CalculatorButtonItem]
    var body: some View {
        VStack(alignment: .leading){
            ForEach(row,id: \.self){ item in
                AnotherCalculatorButton(title: item.title,
                                        size: item.size,
                                        backgroundColorName: item.backgroundColorName,
                                        textColorName: item.textColorName) {
                    print("Button:\(item.title)")
                }

            }
        }
    }

}


struct AnotherCalculatorButton: View {
    
    let fontSize:CGFloat = 38
    let title:String
    let size:CGSize
    let backgroundColorName:String
    let textColorName:String
    let action: ()->Void
    
    let scale: CGFloat = UIScreen.main.bounds.width / 414

    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(Color(textColorName))
                .frame(width: size.width * scale, height: size.height * scale)
                .background(Color(backgroundColorName))
                .clipShape(Capsule(style: .circular))
//                .scaleEffect(scale)
        }
        

    }
}
