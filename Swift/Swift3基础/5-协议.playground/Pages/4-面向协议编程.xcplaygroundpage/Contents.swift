//: [Previous](@previous)

import UIKit

protocol HUD {
    func showWaiting()
}

extension HUD where Self : UIViewController {
    
    func showWaiting() -> Void {
        
        print("显示遮盖")
    }
    
}

class MainViewController: UIViewController , HUD {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        showWaiting()
        
    }
}


class DetailViewControler: UITableViewController,HUD {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        showWaiting()
        
    }
    
//    func showWaiting() {
//        
//        print("自定义遮盖")
//    }
}
