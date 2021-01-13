//
//  Extension_String.swift
//  cn
//
//  Created by Mac on 2020/12/22.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension String {
    
    // TODO: 非空 判断
    ///
    /// 判断数组中所有的字符串都不等于 ""
    ///
    static func cn_allStringHaveValue(strArr: [String?]) -> Bool {
        if strArr.firstIndex(where: { $0 == "" }) != nil {
            // NJLog(message: "有空值")
            return false
        }
        return true
    }
    // TODO: 包含 判断
    ///
    /// 判断数组中所有的字符串包含给定的字符串
    ///
    static func cn_strArrContainGivenValue(compare: String?, strArr: [String?]) -> Bool {
        if strArr.contains(compare) {
            // NJLog(message: "包含")
            return true
        }
        return false
    }
    
}

public extension String {
    
    // TODO: 转成 int、double、float、data
    ///
    /// print(xxx.cn_intValue)
    ///
    
    var cn_intValue: Int {  return Int(self) ?? 0 }

    var cn_doubleValue: Double {  return Double(self) ?? 0 }
    
    var cn_floatValue: Float { return Float(self) ?? 0 }
    
    var cn_dataValue: Data { return self.data(using: .utf8)! }
    
    
    // TODO: 获取字符
    ///
    /// let str = "abcdef"
    /// str.length : 6
    /// str[5]     : "f"
    /// str[80]    : ""
    /// str.substring(fromIndex: 3)  :  "def"
    /// str.substring(toIndex: str.length - 2) : "abcd"
    /// str[1 ..< 3]  : "bc"
    ///
    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    

}

public extension String {
    
    // TODO: 获取汉字首字母
    ///
    ///
    ///
    static func cn_getFirstLetter(strInput: String?) -> String {
        
        if strInput != nil && strInput != "" {
            var ms:NSMutableString? = NSMutableString.init(string: strInput!)
            
            CFStringTransform(ms, UnsafeMutablePointer.init(bitPattern: 0), kCFStringTransformMandarinLatin, false)
            CFStringTransform(ms, UnsafeMutablePointer.init(bitPattern: 0), kCFStringTransformStripDiacritics, false)
            
            var pyArr:[String]? = ms?.components(separatedBy: " ")
            if pyArr != nil && (pyArr?.count)! > 0 {
                var strResult:String = String()
                
                for item in pyArr! {
                    strResult += (item as NSString).substring(to: 1)
                }
                
                return strResult.uppercased()
            }
            
            ms = nil
            pyArr = nil
        }
        
        return strInput!;
    }
    
    // TODO: 获取字符串的宽或高或size，通过确定一个值和字体获取另一个值
    ///
    ///  CGFloat(MAXFLOAT) 或 CGFloat.greatestFiniteMagnitude
    ///
    func cn_getStringWidth(byHeight height: CGFloat, font: UIFont) -> CGFloat {
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        return self.cn_getStringSize(bySize: size, font: font).width
    }
    
    func cn_getStringHeight(byWidth width: CGFloat, font: UIFont) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        return self.cn_getStringSize(bySize: size, font: font).height
    }
    
    func cn_getStringSize(bySize size: CGSize, font: UIFont) -> CGSize {
        let string = self as NSString
        let rect = string.boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: font], context: nil)
        return rect.size
    }
}
