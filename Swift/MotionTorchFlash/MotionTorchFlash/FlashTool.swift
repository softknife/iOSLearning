//
//  FlashTool.swift
//  MotionTorchFlash
//
//  Created by 黄继平 on 2018/7/27.
//  Copyright © 2018年 Eric. All rights reserved.
//

import Foundation
import AVFoundation

struct FlashTool {
    
    
    /// 开关闪光灯
    static func switchFlashState(){
        
        
        // 获取摄像机单例对象
        guard let device = AVCaptureDevice.default(for: .video) else{
            return
        }
        // 判断是否有闪光灯
        guard device.hasFlash && device.hasTorch else{return}
        
        // 调整状态前必须锁定状态
        
        try? device.lockForConfiguration()
        
        if device.flashMode == .off {
            device.flashMode = .on
            device.torchMode = .on
        }else if device.flashMode == .on{
            device.flashMode = .off
            device.torchMode = .off
        }
        
        device.unlockForConfiguration()
    }
    
    
    static func openFlash(){
     
        // 获取摄像机单例对象
        guard let device = AVCaptureDevice.default(for: .video) else{
            return
        }
        // 判断是否有闪光灯
        guard device.hasFlash && device.hasTorch else{return}
        
        // 调整状态前必须锁定状态
        try? device.lockForConfiguration()
        
        if device.flashMode == .off {
            device.flashMode = .on
            device.torchMode = .on
        }
        
        device.unlockForConfiguration()
    }
    
    /// 关闭闪光灯
    static func closeFlash(){
        
        guard let device = AVCaptureDevice.default(for: .video) else{return}
        guard device.hasFlash && device.hasTorch else { return}
        
        try? device.lockForConfiguration()

        if device.flashMode == .on {
            device.flashMode = .off
            device.torchMode = .off
        }
        
        device.unlockForConfiguration()

        
    }
}


/*
 前置和后置摄像头
 enum {
 
 AVCaptureDevicePositionBack                = 1,
 
 AVCaptureDevicePositionFront               = 2
 
 };
 
 typedef NSInteger AVCaptureDevicePosition;
 
 
 
 闪光灯开关
 
 enum {
 
 AVCaptureFlashModeOff  = 0,
 
 AVCaptureFlashModeOn   = 1,
 
 AVCaptureFlashModeAuto = 2
 
 };
 
 typedef NSInteger AVCaptureFlashMode;
 
 
 
 手电筒开关
 
 enum {
 
 AVCaptureTorchModeOff  = 0,
 
 AVCaptureTorchModeOn   = 1,
 
 AVCaptureTorchModeAuto = 2,
 
 };
 
 typedef NSInteger AVCaptureTorchMode;
 
 
 
 焦距调整
 
 enum {
 
 AVCaptureFocusModeLocked              = 0,
 
 AVCaptureFocusModeAutoFocus           = 1,
 
 AVCaptureFocusModeContinuousAutoFocus = 2,
 
 };
 
 typedef NSInteger AVCaptureFocusMode;
 
 
 
 曝光量调节
 
 enum {
 
 AVCaptureExposureModeLocked = 0,
 
 AVCaptureExposureModeAutoExpose = 1,
 
 AVCaptureExposureModeContinuousAutoExposure = 2,
 
 };
 
 typedef NSInteger AVCaptureExposureMode;
 
 
 
 白平衡
 
 enum {
 
 AVCaptureWhiteBalanceModeLocked         = 0,
 
 AVCaptureWhiteBalanceModeAutoWhiteBalance         = 1,
 
 AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance = 2,
 
 };
 
 typedef NSInteger AVCaptureWhiteBalanceMode;
 */
