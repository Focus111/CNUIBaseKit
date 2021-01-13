//
//  Extension_UIFont_Default.swift
//  cn
//
//  Created by Mac on 2020/12/22.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension UIFont {
    
    // TODO: 适配系统字体
    ///
    /// UIFont.cn_fontSize(ofSize: 15, weight: .regular)
    ///
    static func cn_fontSize(ofSize: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        
        let size = cn_scale(ofSize)
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
    
}
