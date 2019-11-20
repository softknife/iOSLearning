//
//  LayoutAndStackLayoutView.swift
//  Calculator
//
//  Created by Reed on 2019/11/20.
//  Copyright © 2019 Reed. All rights reserved.
//

import SwiftUI

/*
 快捷方式抽取公共代码
 “按住 Command 并单击 Button，在弹出的菜单中选择 “Extract Subview”，可以将这个 Button 提取为一个新的 View，把它重命名为 CalculatorButton。”

 */
struct LayoutAndStackLayoutView: View {
    var body: some View {
        HStack{
             CalculatorButton(title: "1", size: .init(width: 88, height: 88), backgroundColorName: "digitBackground") {
                print("button:1")
             }
            
             CalculatorButton(title: "2", size: .init(width: 88, height: 88), backgroundColorName: "digitBackground") {
                 print("button:2")
             }
            
             CalculatorButton(title: "3", size: .init(width: 88, height: 88), backgroundColorName: "digitBackground") {
                 print("button:3")
             }
            
             CalculatorButton(title: "+", size: .init(width: 88, height: 88), backgroundColorName: "operatorBackground") {
                 print("button:+")
             }
            
        }
    }
}

struct LayoutAndStackLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutAndStackLayoutView()
    }
}

struct CalculatorButton: View {
    
    let fontSize:CGFloat = 38
    let title:String
    let size:CGSize
    let backgroundColorName:String
    let action: ()->Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width * 0.5)
        }
    }
}
