//
//  Macro_Capabilities.swift
//  cn
//
//  Created by Mac on 2020/7/3.
//  Copyright © 2020 Mac. All rights reserved.
//
import UIKit
import Foundation
import Photos
import AVFoundation

// 相机权限
// 相册权限
// 定位权限

public struct Macro_Capabilities {

    private init() {}
    
    // 相机权限
    public static func allow_Camera() -> Bool {

        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        
        if authStatus == AVAuthorizationStatus.notDetermined {
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { (bool) in
                
            }
            return true
        }
        if authStatus == AVAuthorizationStatus.authorized && UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            return true
        }
        return false
        
    }
    public static func settings_Camera(controller: UIViewController) {
        let alert = UIAlertController(title: "相机", message: "需要访问您的相机，请到设置里开启", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "设置", style: .default) { (alert) in
            let url: URL = URL.init(string: UIApplication.openSettingsURLString)!
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
    
    // 相册权限
    public static func allow_Photo() -> Bool {

        let authStatus = PHPhotoLibrary.authorizationStatus()
        if authStatus == PHAuthorizationStatus.notDetermined {
            PHPhotoLibrary.requestAuthorization { (status) in
                
            }
            return true
        }
        if authStatus == PHAuthorizationStatus.authorized && UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            return true
        }        
        return false

    }
    public static func settings_Photo(controller: UIViewController) {
        let alert = UIAlertController(title: "相册", message: "需要访问您的相册，请到设置里开启", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "设置", style: .default) { (alert) in
            let url: URL = URL.init(string: UIApplication.openSettingsURLString)!
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
    
    // 定位权限
    public static func allow_Location(Gaode: Bool) -> Bool {

        let authStatus = CLLocationManager.authorizationStatus()
        
        if authStatus == CLAuthorizationStatus.denied || authStatus == CLAuthorizationStatus.restricted || authStatus == CLAuthorizationStatus.notDetermined {
            if Gaode == false {
                CLLocationManager().requestWhenInUseAuthorization()
            }
            return true
        }
        if authStatus != CLAuthorizationStatus.authorizedAlways && authStatus != CLAuthorizationStatus.authorizedWhenInUse && authStatus != CLAuthorizationStatus.notDetermined {
            return false
        }
        
        return true
    }
    public static func settings_Location(controller: UIViewController) {
        let alert = UIAlertController(title: "位置", message: "需要访问您的位置，请到设置里开启", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "设置", style: .default) { (alert) in
            let url: URL = URL.init(string: UIApplication.openSettingsURLString)!
                        
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
