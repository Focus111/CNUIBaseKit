//
//  CNUILabel.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: 初始化多种样式的label
///
/// .middleLine（删除线）
///  >> labelText、colorLine
///
/// .bottomLine（下滑线）
///  >> labelText、colorLine
///
/// .moreColor
///  >> labelText、colorStartLocation、colorLength、colorValue
///
/// .moreFont
///  >> labelText、fontStartLocation、fontLength、fontValue
///
/// .moreColorAndFont
///  >> labelText、colorStartLocation、colorLength、colorValue、fontStartLocation、fontLength、fontValue

public class CNUILabel: UILabel {
    
    public enum CNUILabelType {
        
        case middleLine
        
        case bottomLine
        
        case moreColor
        
        case moreFont
        
        case moreColorAndFont
        
        case normal
        
    }
    
    // 公用
    public var labelText: String? {
        didSet {
            // Layout
            self.setUI()
        }
    }
    // .middleLine、&& .bottomLine
    /// 必须 labelText、colorLine
    
    public var lineColor: UIColor? {
        didSet {
           // Layout
            self.setUI()
        }
    }
    // .moreColor
    /// 必须 labelText、colorStartLocation、colorLength、colorValue
    
    public var colorStartLocation: Int? {
        didSet {
            // Layout
            self.setUI()
        }
    }
    public var colorLength: Int? {
        didSet {
            // Layout
            self.setUI()
        }
    }
    public var colorValue: UIColor? {
        didSet {
            // Layout
            self.setUI()
        }
    }
    // .moreFont
    // 必须 labelText、fontStartLocation、fontLength、fontValue
    
    public var fontStartLocation: Int? {
        didSet {
            // Layout
            self.setUI()
        }
    }
    public var fontLength: Int? {
        didSet {
            // Layout
            self.setUI()
        }
    }
    public var fontValue: UIFont? {
        didSet {
            // Layout
            self.setUI()
        }
    }
    // .moreColorAndFont
    // 必须 labelText、colorStartLocation、colorLength、colorValue、fontStartLocation、fontLength、fontValue
    
    private var labelType: CNUILabelType?

    // MARK: LifeCycle
    public init(frame: CGRect = .zero, labelType: CNUILabelType) {
        super.init(frame: frame)

        self.labelType  = labelType
    }
    
    // MARK: Layout
    private func setUI() {
        
        switch self.labelType {
        case .middleLine:
            // 删除线
            lineColor == nil ? (lineColor = self.textColor):()
            let attributeStr = NSMutableAttributedString(string: self.labelText!)
            let length = self.labelText!.count
            attributeStr.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: length))
            attributeStr.addAttribute(NSAttributedString.Key.strikethroughColor, value: lineColor as Any, range: NSRange(location: 0, length: length))
            
            self.attributedText = attributeStr
        case .bottomLine:
            // 下划线
            lineColor == nil ? (lineColor = self.textColor):()
            let attributeStr = NSMutableAttributedString(string: self.labelText!)
            let length = self.labelText!.count
            attributeStr.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange(location: 0, length: length))
            attributeStr.addAttribute(NSAttributedString.Key.underlineColor, value: lineColor as Any, range: NSRange(location: 0, length: length))
            
            self.attributedText = attributeStr
        case .moreColor:
            // 多个颜色
            if colorStartLocation == nil || colorLength == nil || colorValue == nil {}
            else {
                let attributeStr = NSMutableAttributedString(string: self.labelText!)
                attributeStr.addAttribute(NSAttributedString.Key.foregroundColor, value: colorValue as Any, range: NSRange(location: colorStartLocation!, length: colorLength!))
                
                self.attributedText = attributeStr
            }
        case .moreFont:
            // 多个字体
            if fontStartLocation == nil || fontLength == nil || fontValue == nil {}
            else {
                let attributeStr = NSMutableAttributedString(string: self.labelText!)
                attributeStr.addAttribute(NSAttributedString.Key.font, value: fontValue as Any, range: NSRange(location: fontStartLocation!, length: fontLength!))
                
                self.attributedText = attributeStr
            }
        case .moreColorAndFont:
            // 多个颜色和颜色不同长度字体
            if colorStartLocation == nil || colorLength == nil || colorValue == nil ||  fontStartLocation == nil || fontLength == nil || fontValue == nil  {}
            else {
                let attributeStr = NSMutableAttributedString(string: self.labelText!)
                attributeStr.addAttribute(NSAttributedString.Key.foregroundColor, value: colorValue as Any, range: NSRange(location: colorStartLocation!, length: colorLength!))
                attributeStr.addAttribute(NSAttributedString.Key.font, value: fontValue as Any, range: NSRange(location: fontStartLocation!, length: fontLength!))
                
                self.attributedText = attributeStr
            }
        default:
            // 正常
            cn_Log(message: "正常label")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
