//
//  Macro_NotificationName.swift
//  cn
//
//  Created by Mac on 2020/6/5.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

public struct Macro_NotificationName {

    private init() {}
    
    /// 广告：结束发送通知，首页开始请求
    public static let Home_startRequest = "home_startRequest"
    /// 广告：点击了广告发送通知，首页开始处理
    public static let Home_clickAds     = "Home_clickAds"
    
    /// 支付：微信支付返回结果发送通知
    public static let Pay_WeChat        = "Pay_WeChat"
    /// 支付：支付宝支付返回结果发送通知
    public static let Pay_Alipay        = "Pay_Alipay"
}
