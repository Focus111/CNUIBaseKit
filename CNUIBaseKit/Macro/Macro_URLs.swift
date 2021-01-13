//
//  Macro_URLs.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import Foundation

public struct MyApiRequestUrl {
    
    /// public static var shared: MyApiRequestUrl = MyApiRequestUrl()
    /// private init() {}
    private init() {}
    
    /// 环境域名
    #if DEBUG
    /// 开发
    public static var baseURL = ""
    #else
    /// 正式
    public static var baseURL = ""
    #endif

}
