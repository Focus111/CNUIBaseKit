//
//  Macro_Color.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension UIColor {
    
    // TODO: 常用色
    ///
    ///
    ///
    static let hex_1A1A1A = UIColor(hexString: "#1A1A1A")
    static let hex_222222 = UIColor(hexString: "#222222")
    static let hex_323232 = UIColor(hexString: "#323232")
    static let hex_333333 = UIColor(hexString: "#333333")
    static let hex_233F96 = UIColor(hexString: "#233F96")
    static let hex_666666 = UIColor(hexString: "#666666")
    
    static let hex_999999 = UIColor(hexString: "#999999")
    static let hex_CCCCCC = UIColor(hexString: "#CCCCCC")
    static let hex_E6E6E6 = UIColor(hexString: "#E6E6E6")
    static let hex_EEEEEE = UIColor(hexString: "#EEEEEE")
    static let hex_F5F5F5 = UIColor(hexString: "#F5F5F5")
    static let hex_F93822 = UIColor(hexString: "#F93822")
    
    // TODO: 返回RGB颜色
    ///
    ///
    ///
    static func cn_RGB(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
}
