//
//  Note_Macro.swift
//  CNUIKitSDK
//
//  Created by Mac on 2021/1/6.
//

// MARK: - 🍎 MyApiRequestUrl

/// 暂无用处

// MARK: - 🍎 Macro_Color

/// 暂无用处

// MARK: - 🍎 Macro_Device

/// 🍵 打印信息
///
/// eg: cn_Log(message: "")
///
/// public func cn_Log<T>(message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line) {}

/// 🍵 适配尺寸
///
/// eg: cn_scale(17)
///
/// public func cn_scale(_ ofSize: CGFloat) -> CGFloat {}

/// 🍵 设备相关信息
///
/// 屏幕宽：cn_Width_Screen
/// 屏幕高：cn_Height_Screen
///
/// 状态栏高度：cn_statusBarHeight
///
/// 本地版本号：cn_APP_version
///
/// 广告标识符：cn_Adid
///

// MARK: - 🍎 Macro_Vendor

/// 暂无用处

// MARK: - 🍎 Macro_NotificationName

/// 暂无用处

// MARK: - 🍎 Macro_AppUpdate

/// 🍵 跳转到appStore的app页面
///
/// eg:
///     Macro_AppUpdate.updateApp("1361453785")
///
/// public func updateApp(appId:String) {}


// MARK: - 🍎 Macro_Capabilities
// 相机权限
// 相册权限
// 定位权限

/// 🍵 相机权限
///
/// eg:
///    if Macro_Capabilities.allow_Camera() {}
///    else {
///         Macro_Capabilities.settings_Camera(self)
///    }
///
/// public func allow_Camera() -> Bool {}
/// public func settings_Camera(controller: UIViewController) {}

/// 🍵 相册权限
///
/// eg:
///    if Macro_Capabilities.allow_Photo() {}
///    else {
///         Macro_Capabilities.settings_Photo(self)
///    }
///
/// public func allow_Photo() -> Bool {}
/// public func settings_Photo(controller: UIViewController) {}

/// 🍵 定位权限
///
/// eg:
///    if Macro_Capabilities.allow_Location() {}
///    else {
///         Macro_Capabilities.settings_Location(self)
///    }
///
/// public func allow_Location() -> Bool {}
/// public func settings_Location(controller: UIViewController) {}

// MARK: - 🍎 Macro_ValidateData

/// 🍵 验证email、phone、carNum、username、password、nickname、URL、IP
///
/// eg:
///     Validate.phone("15767087878").isCorrect // true
///     Validate.URL("https://www.baidu.com").isCorrect // true
///
