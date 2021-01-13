//
//  Macro_Device.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import Foundation
import UIKit
import AdSupport

/// 🍵 打印信息
///
/// eg: cn_Log(message: "")
///

public func cn_Log<T>(message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line) {
    #if DEBUG
        print("\n🍵🍵🍵\n当前文件：\((fileName as NSString).lastPathComponent)[\(lineNumber)行]打印方法：\(methodName)\n输出信息：\(message)\n🍵🍵🍵")
    #endif
}

// TODO: 适配尺寸
///
///  cn_scale(17)
///
public func cn_scale(_ ofSize: CGFloat) -> CGFloat {
    
    var size: CGFloat = 0.0
    if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
        size = ofSize * UIScreen.main.bounds.size.width / 375.0
    } else {
        size = ofSize * UIScreen.main.bounds.size.width / 1024.0
    }
    return size
}

/// 屏幕宽和高
public let cn_Width_Screen  = UIScreen.main.bounds.width
public let cn_Height_Screen = UIScreen.main.bounds.height

/// 状态栏高度
public var cn_statusBarHeight: CGFloat {
    if #available(iOS 13.0, *) {
        guard let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager else {
            return 0.00
        }
        return (statusBarManager.statusBarFrame.size.height)
    } else {
        return UIApplication.shared.statusBarFrame.size.height
    }
}

/// 本地版本号
public let cn_APP_version = (Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)

/// adid
public let cn_Adid = ASIdentifierManager.shared().advertisingIdentifier.uuidString


