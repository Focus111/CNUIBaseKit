//
//  Storage_UserDefaults.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

open class Storage_UserDefaults {

    private init() {}
    
    // save
    static func saveData(_ key: String, value: Any?) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    // remove
    static func removeData(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    // clean
    func removeAllData() {
        /// 在工程中继承该类, 并重写该方法, 如: egou_UserDefaults
        
    }
    // return String
    static func queryDataForString(_ key: String) -> String {
        let data = UserDefaults.standard.value(forKey: key)
        if let i = data as? Int {
            return "\(i)"
        }
        if let i = data as? Double {
            return "\(i)"
        }
        if let i = data as? Float {
            return "\(i)"
        }
        if let str = data as? String {
            return str
        }
        if let str = data as? Bool {
            if str == true {
                return "1"
            } else {
                return "0"
            }
        }
        return ""
    }
    // return Int
    static func queryDataForInt(_ key: String) -> Int {
        let data = UserDefaults.standard.value(forKey: key)
        if let i = data as? Int {
            return i
        }
        if let i = data as? Double {
            return Int(i)
        }
        if let i = data as? Float {
            return Int(i)
        }
        if let str = data as? String {
            return Int(str) ?? 0
        }
        if let str = data as? Bool {
            if str == true {
                return 1
            } else {
                return 0
            }
        }
         
        return 0
    }
    // return Float
    static func queryDataForFloat(_ key: String) -> Float {
        let data = UserDefaults.standard.value(forKey: key)
        if let i = data as? Int {
            return Float(i)
        }
        if let i = data as? Double {
            return Float(i)
        }
        if let i = data as? Float {
            return i
        }
        if let str = data as? String {
            return Float(str) ?? 0.0
        }
        if let str = data as? Bool {
            if str == true {
                return 1.0
            } else {
                return 0.0
            }
        }
        
        return 0.0
    }
    // return Bool
    static func queryDataForBool(_ key: String) -> Bool {
        let data = UserDefaults.standard.value(forKey: key)
        if let i = data as? Int {
            if i == 1 {
                return true
            } else {
                return false
            }
        }
        if let i = data as? Double {
            if i >= 1 {
                return true
            } else {
                return false
            }
        }
        if let i = data as? Float {
            if i >= 1 {
                return true
            } else {
                return false
            }
        }
        if let str = data as? String {
            if str == "1" {
                return true
            } else {
                return false
            }
        }
        if let str = data as? Bool {
            return str
        }
         
        return false
    }
}
