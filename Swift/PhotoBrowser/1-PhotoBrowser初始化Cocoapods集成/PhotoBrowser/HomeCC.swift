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

    override func viewDidLoad() {
        super.viewDidLoad()

        

        NetworkTools.instance.request(.post, url: "http://httpbin.org/post", para: ["hjp" : "xxxx"], success: {
            response in
            
            print(response)
            
//            Optional({
//                args =     {
//                };
//                data = "";
//                files =     {
//                };
//                form =     {
//                    hjp = xxxx;
//                };
//                headers =     {
//                    Accept = "*/*";
//                    "Accept-Encoding" = "gzip, deflate";
//                    "Accept-Language" = "en;q=1";
//                    "Content-Length" = 8;
//                    "Content-Type" = "application/x-www-form-urlencoded";
//                    Host = "httpbin.org";
//                    "User-Agent" = "PhotoBrowser/1.0 (iPhone; iOS 10.1; Scale/2.00)";
//                };
//                json = "<null>";
//                origin = "122.224.33.110";
//                url = "http://httpbin.org/post";
//            })
            
        }, failure: {
            error in
            print(error)
            
        })
    }



}

// MARK: DataSource & Delegate
extension HomeCC {
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeReusedCellId, for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
        return cell
    }

}




