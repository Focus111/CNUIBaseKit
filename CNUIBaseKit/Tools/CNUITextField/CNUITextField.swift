//
//  CNUITextField.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: 根据要输入的内容类型
///
///
///
public enum CNUITextFieldInputType {

    case normal
    case money
    case money_leftView
    case phone
    
}

public class CNUITextField: UITextField {
    
    // 结束输入的回调
    public var endInputBlock: ((String)->())?
    // 输入的内容类型
    public var inputType = CNUITextFieldInputType.normal {
        didSet {
            if inputType == CNUITextFieldInputType.money_leftView {
                let label = UILabel.cn_initWith(text: " ¥", textColor: self.textColor!, font: UIFont.cn_fontSize(ofSize: 12.0), lineSpacing: nil)
                label.frame = CGRect(x: 0.0, y: 0.0, width: 10.0, height: bounds.size.height)
                leftView = label
                leftViewMode = .always
            }
        }
    }
    
    public convenience init(text: String, textColor: UIColor, textFont: UIFont, placeholderText: String?, placeholderColor: UIColor?, placeholderFont: UIFont?, cursorColor: UIColor?, textContentType: UITextContentType?, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType, alignment: NSTextAlignment) {
        self.init()
        self.delegate = self
        self.text = text
        self.textColor = textColor
        self.font = textFont
        self.attributedPlaceholder = NSAttributedString(string: placeholderText ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor ?? UIColor.lightGray, NSAttributedString.Key.font: placeholderFont ?? textFont])
        self.textAlignment = alignment
         
        if textContentType != nil {
            self.tintColor = cursorColor
        }
        if textContentType != nil {
            self.textContentType = textContentType
        }
        
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        
        self.clearButtonMode          = .whileEditing
        self.contentVerticalAlignment = .center
        
        let vie = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 6.0, height: bounds.size.height))
        rightView = vie
        rightViewMode = .always
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension CNUITextField: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if inputType == .money {
            
            if textField.text == "¥" {
                textField.text = "¥0.00"
            }
        }
        
        if inputType == .money_leftView  {
            if textField.text == "" {
                textField.text = "0.00"
            }
        }
        if endInputBlock == nil { return }
        endInputBlock!(textField.text ?? "")
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if inputType == .normal {
            return true
        }
        
        if inputType == .money {
            // 第0位"¥"无法编辑
            if range.location == 0 { return false }
            // 第一位数字不能为小数点
            if range.location == 1 {
                if string == "." { return false }
            }
            // 已经包含小数点时，后面不能再输入小数点
            if (textField.text?.contains("."))! {
                if string == "." {  return false }
            }
            // 第一位是大于0的数字时，不能在该位置前面输入0
            if range.location == 1 {
                if textField.text!.count >= 2 {
                    if textField.text![1] == "." {
                        if string == "" || string == "." { return false }
                    } else {
                        if Int(textField.text![1])! >= 0 {
                            if string == "0" || string == "." { return false }
                        }
                    }
                    
                }
            }
            // 第一位为0时，第二位不能为0
            if range.location == 2 {
                if textField.text![1] == "0" {
                    if string == "." || string == "" {
                        return true
                    } else {
                        return false
                    }
                }
            }
            // 保留两位小数
            if textField.text!.contains(".") {
                let strArr =  textField.text!.components(separatedBy: ".")
                if strArr[1].count == 2 {
                    if range.location == strArr[0].count {
                        if string == "." { return false } else { return true }
                    }
                    if range.location == textField.text!.count {
                        if string == "" { return true } else { return false }
                    }
                    
                }
            }
            return true
        }
        if inputType == .money_leftView {
            // 第0位数字不能为小数点
            if range.location == 0 {
                if string == "." { return false }
            }
            // 已经包含小数点时，后面不能再输入小数点
            if (textField.text?.contains("."))! {
                if string == "." {  return false }
            }
            // 第0位是大于0的数字时，不能在该位置前面输入0
            if range.location == 0 {
                if textField.text!.count >= 1 {
                    if textField.text![0] == "." {
                        if string == "" || string == "." { return false }
                    } else {
                        if Int(textField.text![0])! >= 0 {
                            if string == "0" || string == "." { return false }
                        }
                    }
                    
                }
            }
            // 第0位为0时，第一位不能为0
            if range.location == 1 {
                if textField.text![0] == "0" {
                    if string == "." || string == "" {
                        return true
                    } else {
                        return false
                    }
                }
                
            }
            // 保留两位小数
            if textField.text!.contains(".") {
                let strArr =  textField.text!.components(separatedBy: ".")
                if strArr[1].count == 2 {
                    if range.location == strArr[0].count {
                        if string == "." { return false } else { return true }
                    }
                    if range.location == textField.text!.count {
                        if string == "" { return true } else { return false }
                    }
                    
                }
            }
            return true
        }
        if inputType == .phone {
            // 最多十一位
            if textField.text!.count > 10 {
                if string == "" { return true } else { return false }
            }
            // 首位不能为0
            if range.location == 0 {
                if string == "0" { return false }
            }
            // 不能包含小数点
            if string == "." { return false }
            return true
        }
        return true
        
    }
    
}
