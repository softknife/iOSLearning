//: [Previous](@previous)

import UIKit

/*: 
 > 1.Resuable协议
 */
protocol Reusable{

    static var reusableIdentifier : String {get}
    
    static var nib : UINib? {get}
}

/*:
 1.1Resuable默认实现
 */
extension Reusable {
    
    static var reusableIdentifier : String {
        return "\(self)"
    }
    
    static var nib : UINib? {
    
       return nil
    }
}

/*:
 > 2.UITableView扩展
 协议与范型的共同使用!
 */
extension UITableView {

//    func registerCell(_ cellType:UITableViewCell.Type) {
//        
//        register(cellType, forCellReuseIdentifier: <#T##String#>)
//    }
    
    // 此处,如果想给cellType多个约束条件,那么需要用到范型--T
    func registerCell<T:UITableViewCell>(_ cellType:T.Type) where T:Reusable{

        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.reusableIdentifier)
        }else{
            register(cellType, forCellReuseIdentifier: cellType.reusableIdentifier)

        }
        
    }

    func dequeReusableCell<T:UITableViewCell>(indexPath:IndexPath) -> T where T:Reusable {
        return dequeueReusableCell(withIdentifier: T.reusableIdentifier, for: indexPath) as! T
    
    }
    
}

//: [Next](@next)
