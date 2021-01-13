//
//  Extension_UILabel.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension UILabel {
    
    // TODO: 初始化一个UILabel
    ///
    /// let label = UILabel.cn_initWith(background: UIColor.white, text: "xxx", textColor: UIColor.flatRed(), font: UIFont.cn_fontSize(ofSize: 14), alignment: .center, numberOfLines: 1)
    ///
    
    static func cn_initWith(background: UIColor = .white, text: String, textColor: UIColor, font: UIFont, alignment: NSTextAlignment = .left, numberOfLines: Int = 1, lineSpacing: CGFloat? = nil) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = .byCharWrapping
        
        if lineSpacing != nil {
            label.setValue(lineSpacing, forKey: "lineSpacing")
        }
        return label
    }
    
}

fileprivate struct RunTimeLabelKey {
    /// 是否拥有复制功能
    static let isCopyable = UnsafeRawPointer.init(bitPattern: "isCopyable".hashValue)
}
public extension UILabel {
    
    // TODO: 是否拥有复制功能
    ///
    ///
    ///
    var cn_isCopyable: Bool? {
        set {
            objc_setAssociatedObject(self, RunTimeLabelKey.isCopyable!, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            /// 添加长按手势
            self.isUserInteractionEnabled = true
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressCopyEvent))
            self.addGestureRecognizer(longPress)
            
        }
        get {
            return  objc_getAssociatedObject(self, RunTimeLabelKey.isCopyable!) as? Bool
        }
    }
    
    @objc private func longPressCopyEvent(){
        // 让其成为响应者
        becomeFirstResponder()
        
        // 拿出菜单控制器单例
        let menu = UIMenuController.shared
        // 创建一个复制的item
        let copy = UIMenuItem(title: "复制", action: #selector(copyTextEvent))
        // 将复制的item交给菜单控制器（菜单控制器其实可以接受多个操作）
        menu.menuItems = [copy]
        // 设置菜单控制器的点击区域为这个控件的bounds
        if #available(iOS 13.0, *) {
            menu.showMenu(from: self, rect: bounds)
        } else {
            menu.setTargetRect(bounds, in: self)
        }
        
    }
    
    @objc private func copyTextEvent() {
        
        if ((self.text) != nil) {
            UIPasteboard.general.string = self.text
        }else{
            UIPasteboard.general.string = self.attributedText?.string
        }
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        return (action == #selector(copyTextEvent))
    }
    
    /// 拥有成为响应者的能力
    override var canBecomeFirstResponder: Bool{
        return true
    }
}
