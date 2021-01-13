//
//  Extension_Float.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension Float {
    
    // TODO: 返回指定位数的字符串
    ///
    ///
    ///
    
    func cn_stringFormat(decimals: Int = 0) -> String {
        return String(format: "%.\(decimals)f", self)
    }
    
}

public extension Float {
    
    // TODO: 转成 int、string、double、cgFloat、data
    ///
    /// print(xxx.cn_intValue)
    ///
    
    var cn_intValue: Int { return Int(self) }
    
    var cn_stringValue: String {  return String(self) }
    
    var cn_doubleValue: Double {  return Double(self) }
    
    var cn_cgfloatValue: CGFloat { return CGFloat(self) }
    
    var cn_dataValue: Data { return String(self).cn_dataValue }
}
