//
//  Extension_UISwitch.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

#if canImport(UIKit)  && os(iOS)
import UIKit

public extension UISwitch {
    
    // TODO: 初始化一个UISwitch
    ///
    ///
    ///
    static func cn_initWith(isOn: Bool, onColor: UIColor?, thumbColor: UIColor?, scale: CGFloat) -> UISwitch {
        let sw = UISwitch()
        sw.isOn = isOn
        /// 开启后的颜色
        onColor == nil ? ():(sw.onTintColor = onColor)
        /// 圆按钮的颜色
        thumbColor == nil ? ():(sw.thumbTintColor = thumbColor)
        /// 缩放改变大小
        sw.transform = CGAffineTransform(scaleX: scale, y: scale)
        return sw
    }
    
}

public extension UISwitch {
    
    // TODO: 设置UISwitch的image
    ///
    ///
    ///
    func cn_setImage(onImage: UIImage?, offImage: UIImage?) {
        onImage  == nil ? ():(self.onImage  = onImage)
        offImage == nil ? ():(self.offImage = offImage)
        
    }
    
    // TODO: toggle开关
    ///
    ///
    ///
    func cn_toggleSwitch() {
        setOn(!isOn, animated: true)
    }
}

#endif
