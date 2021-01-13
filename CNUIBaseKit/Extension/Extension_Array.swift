//
//  Extension_Array.swift
//  cn
//
//  Created by Mac on 2020/12/22.
//  Copyright © 2020 szq. All rights reserved.
//

import Foundation


// TODO: 处理数组越界的问题，给数组添加一个安全的下标访问方法
///
/// print(arr[safe: 3] as Any)
///
public extension Array {
    subscript(safe index: Int) -> Element? {
        if self.count > index {
            return self[index]
        }
        return nil
    }
}
