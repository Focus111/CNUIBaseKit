//
//  Macro_AppUpdate.swift
//  cn
//
//  Created by Mac on 2020/7/3.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

// TODO: 更新App
///
///
///

public struct Macro_AppUpdate {

    private init() {}
    
    // 更新App
    public static func updateApp(appId:String) {
        let updateUrl:URL = URL.init(string: "http://itunes.apple.com/app/id" + appId)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(updateUrl, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(updateUrl)
        }
    }
}
