//
//  CNUIButton.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: 初始化多种样式的 UIButton
///
///
///
public class CNUIButton: UIButton {
    
    public enum CNUIButtonType {
        
        case leftImgRightTitle
        
        case leftTitleRightImg
        
        case topTitleBottomImg
        
        case topImgBottomTitle
        
    }
    
    public var btnType = CNUIButtonType.leftImgRightTitle
    public var spacing: CGFloat = 0

    public override func layoutSubviews() {
        
        super.layoutSubviews()
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleSize = self.titleRect(forContentRect: self.frame)
        
        var titleInsets: UIEdgeInsets!
        var imageInsets: UIEdgeInsets!
        
        switch btnType {
        case .leftTitleRightImg:
            // 左边文字右边图片
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.size.width + spacing/2), bottom: 0, right: (imageSize.size.width + spacing/2))
            imageInsets = UIEdgeInsets(top: 0, left: (titleSize.size.width + spacing/2), bottom: 0, right: -(titleSize.size.width + spacing/2))
        case .topImgBottomTitle:
            // 上边图片下边文字
            titleInsets = UIEdgeInsets(top: (imageSize.size.height + spacing/2), left: -(imageSize.size.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: -(titleSize.size.height + spacing/2), left: 0, bottom: 0, right: -titleSize.size.width)
        case .topTitleBottomImg:
            // 上边文字下边图片
            titleInsets = UIEdgeInsets(top: -(imageSize.size.height + titleSize.size.height + spacing), left: -(imageSize.size.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.size.width)
        default:
            // 默认（左边图片右边文字）
            titleInsets = UIEdgeInsets(top: 0, left: (spacing/2), bottom: 0, right: -(spacing/2))
            imageInsets = UIEdgeInsets(top: 0, left: -(spacing/2), bottom: 0, right: (spacing/2))
        }
        
        self.imageEdgeInsets = imageInsets
        self.titleEdgeInsets = titleInsets
    }

    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)
        let margin: CGFloat = -20
        let area = self.bounds.insetBy(dx: margin, dy: margin) //负值是方法响应范围
        return area.contains(point)
    }
}
