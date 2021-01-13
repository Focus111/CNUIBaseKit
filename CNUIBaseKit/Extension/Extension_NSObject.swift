//
//  Extension_NSObject.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension NSObject {
    
    // TODO: 动态添加属性
    ///
    ///
    ///
    func cn_setAssociatedObject(key: String, value: Any?) {
        guard let keyHashValue = UnsafeRawPointer(bitPattern: key.hashValue) else { return }
        objc_setAssociatedObject(self, keyHashValue, value, .OBJC_ASSOCIATION_RETAIN)
    }
    
    // TODO: 获取属性值
    ///
    ///
    ///
    func cn_getAssociatedObject(key: String) -> Any? {
        guard let keyHashValue = UnsafeRawPointer(bitPattern: key.hashValue) else { return nil }
        return objc_getAssociatedObject(self, keyHashValue)
    }
    
}
