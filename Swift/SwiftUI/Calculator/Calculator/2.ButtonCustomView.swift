//
//  ButtonCustomView.swift
//  Calculator
//
//  Created by Reed on 2019/11/20.
//  Copyright © 2019 Reed. All rights reserved.
//

import SwiftUI

struct ButtonCustomView: View {
    var body: some View {

        Button(action: {
            print("Button:+")
        }) {
            Text("+")
                .font(.system(size: 50))
                .foregroundColor(.white)
                .frame(width: 88, height: 88)
                .background(Color("operatorBackground"))
                .cornerRadius(44)

        }

    }
}

struct ButtonCustomView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCustomView()
    }
}
