//: Playground - noun: a place where people can play

import UIKit

// https://medium.com/swift-programming/swift-selector-syntax-sugar-81c8a8b10df3

class ViewController:UIViewController{

    
    override func viewDidLoad() {
        
        let btn = UIButton(type: .contactAdd)
        
        btn.addTarget(self, action: .buttonClick, for: .touchUpInside)
        
        
    }
    func test() -> Void {
        
        print("Selector语法糖")
    }
    
   
    
}

extension ViewController{
    @objc func buttonTap(sender: UIButton) {
        
    }
}

extension Selector {
    static let buttonClick = #selector(ViewController.buttonTap)
}
