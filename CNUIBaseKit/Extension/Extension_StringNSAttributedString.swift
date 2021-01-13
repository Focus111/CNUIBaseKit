//
//  Extension_StringNSAttributedString.swift
//  cn
//
//  Created by Mac on 2020/12/22.
//  Copyright © 2020 szq. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    
    // TODO: 使用富文本在一个字符串中表现出不同颜色和字体
    ///
    ///
    ///
    func cn_setAttributedString(colors: [String], fonts: [CGFloat], texts: [String]) -> NSAttributedString {
        
        if colors.count != fonts.count || fonts.count != texts.count {
            return NSMutableAttributedString(string: "缺失富文本参数")
        }
        let attributedStr = NSMutableAttributedString()
        for index in 0..<colors.count {
            let attr = [NSAttributedString.Key.font: UIFont.cn_fontSize(ofSize: fonts[index]), NSAttributedString.Key.foregroundColor : UIColor(hexString: colors[index])]
            let attrStr = NSMutableAttributedString(string: texts[index], attributes: attr as [NSAttributedString.Key : Any])
            
            attributedStr.append(attrStr)
        }
        
        return attributedStr
    }
}
