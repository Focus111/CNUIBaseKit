//
//  Extension_UIButton.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit


fileprivate var kUIButtonClickKey: Int = 0
public extension UIButton {
    
    // TODO: 添加点击事件
    ///
    ///
    ///
    func cn_addTarget(events: UIControl.Event = .touchUpInside, block: @escaping()->Void) {
        
        objc_setAssociatedObject(self, &kUIButtonClickKey, block, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        self.addTarget(self, action: #selector(k_btnAction), for: events)
    }
    @objc private func k_btnAction() {
        
        if let block = objc_getAssociatedObject(self, &kUIButtonClickKey) as? ()->Void {
            
            block()
        }
    }
    
    // TODO: 设置button的文字和图片
    ///
    ///  默认图片在左，文字在右
    ///
    func cn_setTitleAndImage(title: String?, titleColor: UIColor?, image: UIImage?) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.setImage(image, for: .normal)
    }
    
    // TODO: 设置button的文字
    ///
    ///
    ///
    func cn_setTitle(normal: String, selected: String?) {
        self.setTitle(normal, for: .normal)
        self.setTitle(selected, for: .selected)
    }
    
    // TODO: 设置button的文字颜色
    ///
    ///
    ///
    func cn_setTitleColor(normal: UIColor, selected: UIColor?) {
        self.setTitleColor(normal, for: .normal)
        self.setTitleColor(selected, for: .selected)
    }
    
    // TODO: 设置button的image
    ///
    ///
    ///
    func cn_setImage(normal: UIImage, selected: UIImage?) {
        self.setImage(normal, for: .normal)
        self.setImage(selected, for: .selected)
    }
    
    // TODO: 设置button的字体
    ///
    ///
    ///
    func cn_setFont(font: UIFont) {
        self.titleLabel?.font = font
    }
    
}

public extension UIButton {
    
    private var states: [UIControl.State] {
        return [.normal, .selected, .highlighted, .disabled]
    }
    
    // TODO: 设置image  到所有的状态
    ///
    ///
    ///
    func cn_setImageForAllStates(_ image: UIImage) {
        states.forEach { setImage(image, for: $0) }
    }
    
    // TODO: 设置文字    到所有的状态
    ///
    ///
    ///
    func cn_setTitleForAllStates(_ title: String) {
        states.forEach { setTitle(title, for: $0) }
    }
    
    // TODO: 设置文字颜色 到所有的状态
    ///
    ///
    ///
    func cn_setTitleColorForAllStates(_ color: UIColor) {
        states.forEach { setTitleColor(color, for: $0) }
    }
}

public extension UIButton {
    
    // TODO: 设置间隔（样式一：图片在上，文字在下，默认样式二：图片在左，文字在右）
    ///
    /// 默认图片在左，文字在右，imageAboveText == true时，图片在文字上方，否则正常模式
    ///
    
    func cn_setImageAboveText(imageAboveText: Bool = false, spacing: CGFloat) {
        if imageAboveText {
            // https://stackoverflow.com/questions/2451223/#7199529
            guard
                let imageSize = imageView?.image?.size,
                let text = titleLabel?.text,
                let font = titleLabel?.font
                else { return }

            let titleSize = text.size(withAttributes: [.font: font])

            let titleOffset = -(imageSize.height + spacing)
            titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: titleOffset, right: 0.0)

            let imageOffset = -(titleSize.height + spacing)
            imageEdgeInsets = UIEdgeInsets(top: imageOffset, left: 0.0, bottom: 0.0, right: -titleSize.width)

            let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
            contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
        } else {
            let insetAmount = spacing / 2
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
            contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
        }
    }
    
}
