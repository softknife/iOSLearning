//
//  ViewController.swift
//  22-iOS9-NSLayoutAchor&UILayoutGuide
//
//  Created by apple on 2017/5/10.
//  Copyright © 2017年 Eapple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let yellowView = UIView()
        
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yellowView)
        
        yellowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        yellowView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        let viewLayoutGuide = view.layoutMarginsGuide // 系统默认view有个上/下/左/右大约为12的margin
        
        print(viewLayoutGuide.leftAnchor)
        
        let topAchor = redView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 20)
        let leftAchor = redView.leftAnchor.constraint(equalTo: viewLayoutGuide.leftAnchor, constant: 10)
        let widthAchor = redView.widthAnchor.constraint(equalToConstant: 111)
        let heightAchor = redView.heightAnchor.constraint(equalToConstant: 55)
        
        NSLayoutConstraint.activate([topAchor,leftAchor,widthAchor,heightAchor])
        
        
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.constraint(to: view)
        
        
    }


}


extension UIView{

    func constraint(to view:UIView) -> Void {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self)
        
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        self.widthAnchor.constraint(equalToConstant: 144).isActive = true
        self.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
    }
}
