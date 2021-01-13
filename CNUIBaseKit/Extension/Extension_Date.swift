//
//  Extension_Date.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

/*
    let calendar = Calendar.current
    let com = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second, .quarter, .nanosecond, .calendar, .timeZone, .yearForWeekOfYear, .weekdayOrdinal, .weekOfYear, .weekOfMonth, .weekday], from: Date())
    print("\(com)")

 msg:
    calendar: gregorian (current) timeZone: Asia/Shanghai (current) era: 1 year: 2021 month: 1 day: 4 hour: 17 minute: 12 second: 45 nanosecond: 958281993 weekday: 2 weekdayOrdinal: 1 quarter季度: 0 weekOfMonth当月的第几个星期: 2 weekOfYear当年的第几个星期: 2 yearForWeekOfYear: 2021 isLeapMonth是否闰月: false
*/

public extension Date {
    
    
    // TODO: 现在中国日期时间，Date()得到的不是中国日期时间
    ///
    ///
    ///
    static var cn_date: Date {
        let now = Date().addingTimeInterval(TimeInterval(28800))
        return now
    }
    
    // TODO: 现在中国日期戳，Date()得到的不是中国日期时间
    ///
    ///
    ///
    static var cn_timeStamp: Int {
        let now = Date().addingTimeInterval(TimeInterval(28800))
        return Int(now.timeIntervalSince1970)
    }
    
    // TODO: 日期的年
    ///
    ///
    ///
    var cn_year: String {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year], from: self)
        return "\(com.year!)"
    }
    
    // TODO: 日期的月
    ///
    ///
    ///
    var cn_month: String {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.month], from: self)
        return "\(com.month!)"
    }
    
    // TODO: 日期的日
    ///
    ///
    ///
    var cn_day: String {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.day], from: self)
        return "\(com.day!)"
    }
    
    // TODO: 日期是星期几
    ///
    ///
    ///
    var cn_weekDay: String {
        /// let interval = Int(self.timeIntervalSince1970)
        /// let days = Int(interval/86400) // 24*60*60
        /// let weekday = ((days + 4)%7+7)%7
        /// return weekday == 0 ? 7 : weekday
        
        // 1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.weekday], from: self)
        return "\(com.weekday!)"
    }
    
    // TODO: 日期月份有多少天
    ///
    ///
    ///
    var cn_monthDays: String {
        let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let range = calendar?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self)
        return "\((range?.length)!)"
    }
    
    // TODO: 日期月份第一天是星期几
    ///
    ///
    ///
    var cn_monthFirstDayisWeek: String {
        
        // 1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date = dateFormatter.date(from: self.cn_year+"-"+self.cn_month)
        let calender = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let comps = calender?.components(NSCalendar.Unit.weekday, from: date!)
        guard let week = comps?.weekday else {
            return "日期错误"
        }
        return "\(week)"
    }
    
    // TODO: 日期月份的下月最后一天的日期
    ///
    ///
    ///
    var cn_nextMonthLastDayDate: String {
        var year = Int(self.cn_year) ?? 0
        var month = Int(self.cn_month) ?? 0
        if month == 12 {
            year += 1
            month = 1
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date = dateFormatter.date(from: String(year)+"-"+String(month))
        let calender = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let range = calender?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: date!)
        
        return String(year)+"-"+String(month)+"-"+"\((range?.length)!)"
        
    }
    
}

public extension Date {
    
    // TODO: 日期字符串转Date
    ///
    /// "yyyy-MM-dd"
    /// Date.cn_getDateFrom(dateStr: "2021-01-05", dateFormat: "yyyy-MM-dd")
    ///
    static func cn_getDateFrom(dateStr: String, dateFormat: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: dateStr)
        return date ?? nil
    }
    
    // TODO: Date转日期字符串
    ///
    /// Date.cn_getStringFromDate(dateStr: "2021-01", dateFormat: "yyyy-MM-dd")
    ///
    static func cn_getStringFrom(date: Date, dateFormat: String) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let dateStr = dateFormatter.string(from: date)
        return dateStr
    }
    
    // TODO: 根据年月得到某月天数
    ///
    ///
    ///
    static func cn_getMonthDays(year: String, month: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date = dateFormatter.date(from: year+"-"+month)
        let calender = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let range = calender?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: date!)
        
        return "\((range?.length)!)"
    }
    
    // TODO: 根据年月得到某月第一天是周几
    ///
    ///
    ///
    static func cn_getMonthFirstDayisWeek(year: String, month: String) -> String {
        
        // 1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date = dateFormatter.date(from: year+"-"+month)
        let calender = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let comps = calender?.components(NSCalendar.Unit.weekday, from: date!)
        guard let week = comps?.weekday else {
            return "日期错误"
        }
        return "\(week)"
        
    }
    
    // TODO: 计算两个日期之间的天数
    ///
    /// yyyy年MM月dd日 或 yyyy-MM-dd
    ///
    ///
    static func cn_getDaysBetweenDate(date_1: String, date_2: String, dateFormat: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date_one = dateFormatter.date(from: date_1)
        let date_two = dateFormatter.date(from: date_2)
        guard let date_left = date_one, let date_right = date_two else {
            return 0
        }
        let interval = date_right.timeIntervalSince(date_left)
        return Int(interval/86400)
    }
    
    // TODO: 计算两个日期之间的天数
    ///
    ///
    ///
    static func cn_getDaysBetweenDate(fromeDate: Date, toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: fromeDate, to: toDate)
        return components.day ?? 0
    }
    
    // TODO: 计算两个日期之间的小时数
    ///
    ///
    ///
    static func cn_getHoursBetweenDate(fromeDate: Date, toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.hour], from: fromeDate, to: toDate)
        return components.hour ?? 0
    }
    
    // TODO: 计算两个日期之间的分钟数
    ///
    ///
    ///
    static func cn_getMinutesBetweenDate(fromeDate: Date, toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.minute], from: fromeDate, to: toDate)
        return components.minute ?? 0
    }
    
    
    // TODO: 将时间转换为时间戳
    ///
    /// "yyyy-MM-dd HH:mm:ss"
    ///
    static func cn_getTimeStampFrom(dateStr: String, dateFormat: String) -> Int {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = dateFormat
        dfmatter.locale = Locale.current
        
        guard let date = dfmatter.date(from: dateStr) else {
            return 0
        }
        let stamp:TimeInterval = date.timeIntervalSince1970

        return Int(stamp)
    }
    
    // TODO: 将时间戳转换为具体时间
    ///
    /// yyyy年MM月dd日 HH:mm:ss
    /// yyyy-MM-dd HH:mm:ss
    /// HH:mm:ss
    ///
    static func cn_getDateStrFrom(timeStamp: String, dateFormat: String) -> String {
        let timeSta: TimeInterval = timeStamp.cn_doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = dateFormat
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }
    
    
    
    // TODO: 比较两个日期之间的先后
    ///
    /// ComparisonResult：
    ///   orderedAscending， 早于
    ///   orderedSame，      等于
    ///   orderedDescending，晚于
    func cn_compareBetweenDate(otherDate: Date) -> ComparisonResult {
        return self.compare(otherDate)
    }
}

public extension Date {
    
    // TODO: 数字转月份
    ///
    ///
    ///
    static func cn_getMonthFrom(num: Int) -> String {
        let arr = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
        return arr[num-1]
        
    }
    // TODO: 将时间显示为（几分钟前，几小时前，几天前）
    ///
    ///
    ///
    static func cn_getAgoTextFromNow(time: String, dateFormat: String) -> String {
        
        guard let givenDate = Date.cn_getDateFrom(dateStr: time, dateFormat: dateFormat) else {
            return time
        }
        
        let now = Date.cn_date
        let timeInterval = now.timeIntervalSince(givenDate)
        
        var temp: Double = 0
        let days = Double(Date.cn_date.cn_monthDays) ?? 30
        
        if timeInterval < 60 {
            return "刚刚"
        }
        if (timeInterval/60) < 60 {
            temp = timeInterval/60
            return "\(Int(temp))分钟前"
        }
        if timeInterval/60/60 < 24 {
            temp = timeInterval/60/60
            return "\(Int(temp))小时前"
        }
        if timeInterval/(24 * 60 * 60) < days {
            temp = timeInterval / (24 * 60 * 60)
            return "\(Int(temp))天前"
        }
        if timeInterval/(30 * 24 * 60 * 60) < 12 {
            temp = timeInterval/(30 * 24 * 60 * 60)
            return "\(Int(temp))个月前"
        }
        if timeInterval/(30 * 24 * 60 * 60) > 12 {
            temp = timeInterval/(12 * 30 * 24 * 60 * 60)
            return "\(Int(temp))年前"
        }
        return time
    }
    
    // TODO: 通过添加年或月或日，得到一个新的日期
    ///
    ///
    ///
    static func cn_getNewDateByAdding(year: Int, month: Int, day: Int) -> Date? {
        
        let current = Date.cn_date
        let calendar = Calendar(identifier: .gregorian)
        var comps:DateComponents?
        
        comps = calendar.dateComponents([.year,.month,.day], from: current)
        comps?.year = year
        comps?.month = month
        comps?.day = day
        return calendar.date(byAdding: comps!, to: current)
    }
}
    
    
    
    
