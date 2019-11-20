//
//  ViewModifier.swift
//  Calculator
//
//  Created by Reed on 2019/11/20.
//  Copyright © 2019 Reed. All rights reserved.
//

import SwiftUI


/*
“Xcode 预览使用了动态替换 body 属性的特性，但是它有一些局限：当 body 以外的部分被改变，导致 ContentView 需要整个重新编译时 (比如在 ContentView 中随意加入一个存储属性 var value = 1)，你必须再次点击 Resume 按钮才能重新开始预览。默认情况下刷新预览的快捷键是 Option + Command + P。”

[font]:
“将文本字体设置为 Font.title。除了 .title 以外，SwiftUI 还预定义了一系列字体，比如 .headline，.body 等。你可以在 Apple 提供的人机交互指南 (HIG) 的排版页面中找到每种预定义字体所对应的具体大小。如果你想要具体按数值指定字号的话，可以使用 .font(.system(size: 48)) 的方式；除了系统提供的字体，你也可以通过指定名字，来使用自定义字体：.font(.custom("Copperplate", size: 48))。”

[padding]:
“.padding(.top, 16) 将在上方填充 16 point 的空白，.padding(.horizontal, 8) 在水平方向 (也即 [.leading, .trailing]) 填充 8 point。”

[background]:
“使用 background 为文本指定背景。这个方法接受的参数只需要满足 View，也就是说，除了像例子中设定一个 Color 以外 (Color 也是一个遵守 View 协议的类型)，你也可以将任意的 View 作为背景元素进行设置。

”


[View Modifier]
“一个 view modifier 作用在某个 View 上，并生成原来值的另一个版本。按照这个定义，大致来说，view modifier 分为两种类别：

像是 font，foregroundColor 这样定义在具体类型 (比如例中的 Text) 上，然后返回同样类型 (Text) 的原地 modifier。

像是 padding，background 这样定义在 View extension 中，将原来的 View 进行包装并返回新的 View 的封装类 modifier。

原地 modifier 一般来说对顺序不敏感，对布局也不关心，它们更像是针对对象 View 本身的属性的修改。而与之相反，封装类的 modifier 的顺序十分重要。”


*/


struct ViewModifier: View {
    var body: some View {
        Text("+")
            .font(.system(size: 50))
            .foregroundColor(.white)
            .frame(width: 88, height: 88)
            .background(Color("operatorBackground"))
            .cornerRadius(44)
//            .padding()
//            .background(Color.blue)
    }
}

struct ViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifier()
    }
}
