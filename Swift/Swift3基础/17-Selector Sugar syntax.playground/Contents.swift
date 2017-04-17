//: Playground - noun: a place where people can play

import UIKit

// https://medium.com/swift-programming/swift-selector-syntax-sugar-81c8a8b10df3

class ViewController:UIViewController{

    
    override func viewDidLoad() {
        
        let btn = UIButton(type: .contactAdd)
        
        btn.addTarget(self, action: .buttonClick, for: .touchUpInside)
        btn.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
        
    }
    func test() -> Void {
        
        print("Selector语法糖")
    }
    
   
    
}

extension ViewController{
    
    // 如果想使用fileprivate,那么此处需要用@objc修饰,制造一个假的动态派发,实际上编译时,还是会链接该函数实现
    @objc fileprivate func buttonTap(sender: UIButton) {
        
    }
    
    func buttonClick(sender:UIButton)  {
        
    }
    
    
}


extension Selector {
    static let buttonClick = #selector(ViewController.buttonTap)
}
