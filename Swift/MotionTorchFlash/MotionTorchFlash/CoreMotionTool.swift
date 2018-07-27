//
//  CoreMotionTool.swift
//  MotionTorchFlash
//
//  Created by 黄继平 on 2018/7/27.
//  Copyright © 2018年 Eric. All rights reserved.
//

import Foundation
import CoreMotion


struct MotionTool {
    
    typealias Manager = CMMotionManager
    
    enum MotionError:Error,CustomStringConvertible{
        case gyroUnavailable
        case sth(String)
        
        var description: String{
            switch self {
            case .gyroUnavailable:
                return "设备小于iPhone4，或者陀螺仪损坏"
            case .sth(let desc):
                return desc
                
            }
        }
    }
    
}

// MARK:- 监测陀螺仪
extension MotionTool{
    
    static func pushGyroUpdates( failure: ((MotionError)->Void)? , success: ((CMRotationRate)->Void)?) ->CMMotionManager?{
        
        // 创建运动管理者对象
        let manager = CMMotionManager()
        // 判断加速计是否可用
        guard manager.isGyroAvailable else{
            failure?(MotionError.gyroUnavailable)
            return nil
        }
        
        // 设置采样率 每秒10次
        manager.gyroUpdateInterval = 1.0/10
        
        // 各轴旋转加速度
        manager.startGyroUpdates(to: OperationQueue.main) { (data, error) in
            if let error = error {
                let desc = error.localizedDescription
                failure?(MotionError.sth(desc))
                return
            }
            
            // 获取陀螺仪信息
            guard let rate = data?.rotationRate else{
                return
            }
            
            
            
            
            #if DEBUG
            print("X:\(rate.x),Y:\(rate.y),Z:\(rate.z)")
            
            
            #endif
            
            success?(rate)
        }
        
        return manager
    }
    
    
    /// 停止陀螺仪监听
    static func stopGyroUpdates(){
        
        // 创建运动管理者对象
        let manager = CMMotionManager()
        // 判断加速计是否可用
        guard manager.isGyroAvailable else{
            return
        }
        manager.stopGyroUpdates()
        
    }

}

// MARK:- 监测位移
extension MotionTool{
    
    static func startMotionUpdates( failure: ((MotionError)->Void)? , success: ((Double)->Void)?) ->CMMotionManager?{
        
        // 创建运动管理者对象
        let manager = CMMotionManager()
        // 判断加速计是否可用
        guard manager.isDeviceMotionAvailable else{
            failure?(MotionError.gyroUnavailable)
            return nil
        }
        
        // 设置采样率 每秒10次
        manager.deviceMotionUpdateInterval = 1.0/10
        
        // 各轴旋转加速度
        manager.startDeviceMotionUpdates(to: OperationQueue()) { (motion, error) in
            if let error = error {
                let desc = error.localizedDescription
                failure?(MotionError.sth(desc))
                return
            }
            
            guard let motion = motion else{return}
            
            // Gravity 获取手机的重力值在各个方向上的分量，根据这个就可以获得手机的空间位置，倾斜角度等
            let gX = motion.gravity.x
            let gY = motion.gravity.y
            let gZ = motion.gravity.z
            
            // 获取手机的倾斜角度(zTheta是手机与水平面的夹角， xyTheta是手机绕自身旋转的角度)：
            let zTheta = atan2(gZ, sqrt(gX * gX + gY * gY)) / Double.pi * 180
            let xyTheta = atan2(gX, gY) / Double.pi * 180

            #if DEBUG
            print("手机与水平面的夹角 --- \(zTheta), 手机绕自身旋转的角度为 --- \(xyTheta)")
            #endif
            
            success?(zTheta)
        }
        
        return manager
        
    }
    
    
    /// 停止motion监测
    static func stopMotionUpdates(){
        
        // 创建运动管理者对象
        let manager = CMMotionManager()
        // 判断加速计是否可用
        guard manager.isDeviceMotionAvailable else{
            return
        }
        manager.stopDeviceMotionUpdates()

    }

}

// 传感器介绍：https://www.cnblogs.com/chglog/p/4850589.html
