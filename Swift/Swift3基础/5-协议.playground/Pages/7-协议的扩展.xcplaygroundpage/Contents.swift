//: [Previous](@previous)

import UIKit

extension UITableViewDataSource{
    
    func numberOfRowsInSection(_ temTableView:UITableView) -> Int {
        
        // 由于numberOfSections方法为可选的,所以需要这样写!
        guard let sections = numberOfSections?(in: temTableView) else {
            
            return 0
        }
        
        var total : Int
        for i in 0..<sections {
            
            let rows = tableView(temTableView, numberOfRowsInSection: i)
            
            total += rows
        }
        
        
        return total
        
    }
}





//: [Next](@next)
