//
//  CN_Json.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: JSONString 转其它
///
///
///

public struct CN_Json {

    private init() {}
    
    // TODO: JSONString转字典
    ///
    /// print(CN_Json.getDictFromJsonStr(JsonStr: String))
    ///
    public static func getDictFromJsonStr(JsonStr: String) -> NSDictionary {
        let jsonData: Data = JsonStr.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        return (dict as! NSDictionary)
    }

}

// TODO: 其它 转JSONString
///
///
///
public extension CN_Json {
    
    // TODO: String转JSONString
    ///
    /// print(CN_Json.getJsonStrFromStr(str: String))
    ///
    static func getJsonStrFromStr(str: String) -> String {
        
        var payDataJsonStr: String? = nil
        if let anError = try? JSONSerialization.data(withJSONObject: str, options: .prettyPrinted) {
            payDataJsonStr = String(data: anError, encoding: .utf8)
        }
        return payDataJsonStr!
    }
    
    // TODO: Dictionary转JSONString
    ///
    /// print(CN_Json.getJsonStrFromDict(dict: Dictionary))
    ///
    static func getJsonStrFromDict(dict: NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dict)) {
            return "无法解析出JSONString"
        }
        let data : NSData! = try! JSONSerialization.data(withJSONObject: dict, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    
    // TODO: Array转JSONString
    ///
    /// print(CN_Json.getJsonStrFromArray(array: Array<Any>))
    ///
    static func getJsonStrFromArray(array: Array<Any>) -> String {
        if (!JSONSerialization.isValidJSONObject(array)) {
            return "无法解析出JSONString"
        }
        let data : NSData! = try! JSONSerialization.data(withJSONObject: array, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    
}
