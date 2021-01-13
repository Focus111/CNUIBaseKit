//
//  Extension_Int.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension Int {
    
    // TODO: 是否是偶数
    ///
    /// print(xxx.cn_isEven)
    ///
    
    var cn_isEven: Bool { return self % 2 == 0 }
    
}

public extension Int {
    
    // TODO: 转成 string、double、float、cgFloat、data
    ///
    /// print(xxx.cn_intValue)
    ///
    
    var cn_stringValue: String {  return String(self) }
    
    var cn_doubleValue: Double {  return Double(self) }
    
    var cn_floatValue: Float { return Float(self) }
    
    var cn_cgfloatValue: CGFloat { return CGFloat(self) }
    
    var cn_dataValue: Data { return String(self).cn_dataValue }
}
    
    
    
