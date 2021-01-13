//
//  Note_Storage.swift
//  CNUIKitSDK
//
//  Created by Mac on 2021/1/6.
//

// MARK: - 🍎 Storage_UserDefaultsKeys

/// 暂无用处

// MARK: - 🍎 Storage_UserDefaults

/// 在工程中继承该类, 并重写该方法 class func removeAllData() {}

/// 🍵 保存值
///
/// eg:
///     Storage_UserDefaults.saveData("region", value: "中国")
///
/// static func saveData(_ key: String, value: Any?) {}

/// 🍵 移除值
///
/// eg:
///     Storage_UserDefaults.removeData("region")
///
/// static func removeData(_ key: String) {}

/// 🍵 移除所有值
/// 在工程中继承该类, 并重写该方法
///
/// eg:
///     Storage_UserDefaults.removeAllData()
///
/// func removeAllData() {}

/// 🍵 查询String值
///
/// eg:
///     Storage_UserDefaults.queryDataForString("region")
///
/// static func queryDataForString(_ key: String) -> String {}

/// 🍵 查询Int值
///
/// eg:
///     Storage_UserDefaults.queryDataForInt("region")
///
/// static func queryDataForInt(_ key: String) -> String {}

/// 🍵 查询Float值
///
/// eg:
///     Storage_UserDefaults.queryDataForFloat("region")
///
/// static func queryDataForFloat(_ key: String) -> String {}

/// 🍵 查询Bool值
///
/// eg:
///     Storage_UserDefaults.queryDataForBool("region")
///
/// static func queryDataForBool(_ key: String) -> String {}
