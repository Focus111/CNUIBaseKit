//
//  Extension_UITextField.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: 提示请使用 CNUITextField
///
/// 请使用 CNUITextField
///
public extension UITextField {

    // TODO: UITextField 是否有值
    ///
    ///
    ///
    var cn_isEmpty: Bool {
        return text?.isEmpty == true
    }
    
    // TODO: UITextField 清除文本
    ///
    ///
    ///
    func cn_clean() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    
}

public extension UITextField {
    
    // TODO: UITextField 设置占位符文本颜色
    ///
    ///
    ///
    func cn_setPlaceholderColor(color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
    }
    
    // TODO: UITextField 在左侧设置填充视图增加间距
    ///
    ///
    ///
    func cn_addPaddingToLeft(_ padding: CGFloat) {
        if leftView == nil {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
            leftView = paddingView
            leftViewMode = .always
        } else {
            let paddingView = leftView
            paddingView?.contentMode = .center
            paddingView!.frame = CGRect(x: 0, y: 0, width: paddingView!.cn_width + padding, height: paddingView!.cn_height)
            leftView = paddingView
            leftViewMode = .always
        }
        
    }
    
    // TODO: UITextField 设置leftView是图片的颜色。
    ///
    ///
    ///
    var cn_leftViewTintColor: UIColor? {
        get {
            guard let iconView = leftView as? UIImageView else { return nil }
            return iconView.tintColor
        }
        set {
            guard let iconView = leftView as? UIImageView else { return }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
    
    // TODO: UITextField 设置rightView是图片的颜色。
    ///
    ///
    ///
    var cn_rightViewTintColor: UIColor? {
        get {
            guard let iconView = rightView as? UIImageView else { return nil }
            return iconView.tintColor
        }
        set {
            guard let iconView = rightView as? UIImageView else { return }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
}
