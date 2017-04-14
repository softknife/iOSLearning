//
//  HomeCC.swift
//  PhotoBrowser
//
//  Created by 黄继平 on 2016/11/28.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit


private let homeReusedCellId = "homeReusedCellId"
class HomeCC: UICollectionViewController {

    
    
    /// 懒加载-模型数组
    fileprivate lazy var shops = [Shop]()
    
    
    
    /// 系统函数
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        
    
    }



}


// MARK: Request Data
extension HomeCC{
    
    fileprivate func loadData() ->Void{
    
        loadHomeData { (resultArray) in
            
            guard let resultArray = resultArray else {
                return
            }
            
            for dict in resultArray {
                
                print(dict)
                
                let shop = Shop(dict: dict)
                
                self.shops.append(shop)
                
            }
            
            self.collectionView?.reloadData()

        }

    }
}

// MARK: DataSource & Delegate
extension HomeCC {
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shops.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeReusedCellId, for: indexPath) as! CollectionViewCell
        
        cell.shop = shops[indexPath.item]

        return cell
    }

}




