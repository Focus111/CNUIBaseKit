//
//  Extension_Double.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension Double {
    
    // TODO: 返回指定位数的字符串
    ///
    ///
    ///
    
    func cn_stringFormat(decimals: Int) -> String {
        return String(format: "%.\(decimals)f", self)
    }
    
    // TODO: 四舍五入 到小数点后某一位
    ///
    ///
    ///
    func cn_roundedTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
}

public extension Double {
    
    // TODO: 转成 int、string、float、cgFloat、data
    ///
    /// print(xxx.cn_intValue)
    ///
    
    var cn_intValue: Int {  return Int(self) }

    var cn_stringValue: String {  return String(self) }
    
    var cn_floatValue: Float { return Float(self) }
    
    var cn_cgfloatValue: CGFloat { return CGFloat(self) }
    
    var cn_dataValue: Data { return String(self).cn_dataValue }
    
}
