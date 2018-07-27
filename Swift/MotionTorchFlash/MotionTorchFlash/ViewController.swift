//
//  ViewController.swift
//  MotionTorchFlash
//
//  Created by 黄继平 on 2018/7/27.
//  Copyright © 2018年 Eric. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    private var manager : MotionTool.Manager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchFlash(_ sender: Any) {
        
        FlashTool.switchFlashState()
    }
    
    @IBAction func closeFlash(_ sender: Any) {
        FlashTool.closeFlash()
    }
    
    @IBAction func startGyro(_ sender: Any) {
        manager = MotionTool.pushGyroUpdates(failure: { (error) in
            print(error.description)
        }) { (rate) in
            
        }
    }
    
    @IBAction func stopGyro(_ sender: Any) {
        
        MotionTool.stopGyroUpdates()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        manager =  MotionTool.startMotionUpdates(failure: { (error) in
            
            print(error.description)
        }) { delta in
            
            if delta < -30 || delta > 90 {
                FlashTool.closeFlash()
            }else{
                FlashTool.openFlash()
            }
        }
    }
}

