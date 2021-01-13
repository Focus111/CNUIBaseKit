//
//  Note.swift
//  CNUIKitSDK
//
//  Created by Mac on 2020/12/30.
//

// Note
// MARK: - 🍎 CNUIFont

/// 🍵 适配不同字体
///
/// eg: label.font = CNUIFont.PingFangSC_Medium.cn_fontSize(ofSize: 24)
///
/// 将字体名字替换掉 PingFangSC_Medium 即可。
///

// MARK: - 🚩 Extension_UIFont_Default

/// 🍵 适配系统字体
///
/// eg: label.font = UIFont.cn_fontSize(ofSize: 15, weight: .regular)
///
///

// MARK: - 🚩 Extension_UIFont_Choose

/// 🍵 适配不同字体
///
/// eg: label.font = UIFont.cn_fontSize(ofName: FontName.AlNile, type: FontType.Bold, size: 12.0)
///
/// 假如字体是 "GillSans-Bold", FontName就是GillSans, FontType就是Bold。
/// 将字体名字替换掉 FontName.AlNile, 类型替换掉 FontType.Bold 即可。
///
///

// MARK: - 🚩 Extension_NSObject

/// 🍵 动态添加属性
///
/// eg: func xxx(_ block: (()->())?) {
///         cn_setAssociatedObject(key: "k_UIViewClickActionKey", value: block)
///     }
///
/// func cn_setAssociatedObject(key: String, value: Any?) {}

/// 🍵 获取属性值
///
/// eg: (cn_getAssociatedObject(key: "k_UIViewClickActionKey") as? (()->())?
///
/// func cn_getAssociatedObject(key: String) -> Any? {}


// MARK: - 🚩 Extension_CGFloat

/// 🍵 返回指定位数的字符串
///
/// eg: let cgfl = 10.0
///     cgfl.cn_stringFormat(decimals: 2)
///
/// func cn_stringFormat(decimals: Int = 0) -> String {}

/// 🍵 转成 int、string、double、float、data
///
/// eg: let cgfl = 10.0
///     print(cgfl.cn_dataValue)
///
/// var cn_intValue: Int {  return Int(self) }
/// var cn_stringValue: String {  return "\(self)" }
/// var cn_doubleValue: Double { return Double(self) }
/// var cn_floatValue: Float { return Float(self) }
/// var cn_dataValue: Data { return "\(self)".cn_dataValue }

// MARK: - 🚩 Extension_Double

/// 🍵 返回指定位数的字符串
///
/// eg: let dou = 10.0
///     dou.cn_stringFormat(decimals: 2)
///
/// func cn_stringFormat(decimals: Int = 0) -> String {}

/// 🍵 四舍五入 到小数点后某一位
///
/// eg: let dou = 10.0
///     dou.cn_roundedTo(places: 2)
///
/// func cn_roundedTo(places: Int) -> Double {}

/// 🍵 转成 int、string、float、cgFloat、data
///
/// eg: let dou = 10.0
///     print(dou.cn_dataValue)
///
/// var cn_intValue: Int {  return Int(self) }
/// var cn_stringValue: String {  return String(self) }
/// var cn_floatValue: Float { return Float(self) }
/// var cn_cgfloatValue: CGFloat { return CGFloat(self) }
/// var cn_dataValue: Data { return String(self).cn_dataValue }

// MARK: - 🚩 Extension_Int

/// 🍵 是否是偶数
///
/// eg: print(xxx.cn_isEven)
///
/// var cn_isEven: Bool { return self % 2 == 0 }

/// 🍵 转成 string、double、float、cgFloat、data
///
/// eg: print(xxx.cn_dataValue)
///
/// var cn_stringValue: String {  return String(self) }
/// var cn_doubleValue: Double {  return Double(self) }
/// var cn_floatValue: Float { return Float(self) }
/// var cn_cgfloatValue: CGFloat { return CGFloat(self) }
/// var cn_dataValue: Data { return String(self).cn_dataValue }

// MARK: - 🚩 Extension_Float

/// 🍵 返回指定位数的字符串
///
/// eg: let cgfl = 10.0
///     cgfl.cn_stringFormat(decimals: 2)
///
/// func cn_stringFormat(decimals: Int = 0) -> String {}

/// 🍵 转成 int、string、double、cgFloat、data
///
/// eg: print(xxx.cn_dataValue)
///
/// var cn_intValue: Int { return Int(self) }
/// var cn_stringValue: String {  return String(self) }
/// var cn_doubleValue: Double {  return Double(self) }
/// var cn_cgfloatValue: CGFloat { return CGFloat(self) }
/// var cn_dataValue: Data { return String(self).cn_dataValue }

// MARK: - 🚩 Extension_Array

/// 🍵 处理数组越界的问题，给数组添加一个安全的下标访问方法
///
/// eg: let arr = [1, 2, 3]
///     print(arr[safe: 0] as Any)
///
/// subscript(safe index: Int) -> Element? {}

// MARK: - 🚩 Extension_String_MD5

/// 🍵 MD5加密
///
/// eg: print(str.cn_md5())
///
/// func cn_md5() -> String {}

// MARK: - 🚩 Extension_String

/// 🍵 非空 判断, 判断数组中所有的字符串都不等于 ""
///
/// eg: let arr = ["1", "2", "3"]
///     print(String.cn_allStringHaveValue(strArr: arr))
///
/// static func cn_allStringHaveValue(strArr: [String?]) -> Bool { }

/// 🍵 包含 判断, 判断数组中所有的字符串包含给定的字符串
///
/// eg: let arr = ["1", "2", "3"]
///     print(String.cn_strArrContainGivenValue(compare: "1", strArr: arr))
///
/// static func cn_strArrContainGivenValue(compare: String?, strArr: [String?]) -> Bool {}

/// 🍵 转成 int、double、float、data
///
/// eg: print(xxx.cn_intValue)
///
/// var cn_intValue: Int {  return Int(self) ?? 0 }
/// var cn_doubleValue: Double {  return Double(self) ?? 0 }
/// var cn_floatValue: Float { return Float(self) ?? 0 }
/// var cn_dataValue: Data { return self.data(using: .utf8)! }

/// 🍵  获取字符
///
/// eg: let str = "abcdef"
///     str.length : 6
///     str[5]     : "f"
///     str[80]    : ""
///     str.substring(fromIndex: 3)  :  "def"
///     str.substring(toIndex: str.length - 2) : "abcd"
///     str[1 ..< 3]  : "bc"
///
/// var length: Int {}
/// subscript (i: Int) -> String {}
/// func substring(fromIndex: Int) -> String {}
/// func substring(toIndex: Int) -> String {}
/// subscript (r: Range<Int>) -> String {}

/// 🍵 获取汉字首字母
///
/// eg: print(String.cn_getFirstLetter(strInput: "美"))
///
/// static func cn_getFirstLetter(strInput: String?) -> String {}

/// 🍵 获取字符串的宽或高或size，通过确定一个值和字体获取另一个值
///
/// CGFloat(MAXFLOAT) 或 CGFloat.greatestFiniteMagnitude
///
/// eg: let str = "中国"
///     let width: CGFloat = str.cn_getStringWidth(byHeight height: CGFloat, font: UIFont)
///
/// func cn_getStringWidth(byHeight height: CGFloat, font: UIFont) -> CGFloat {}
/// func cn_getStringHeight(byWidth width: CGFloat, font: UIFont) -> CGFloat {}
/// func cn_getStringSize(bySize size: CGSize, font: UIFont) -> CGSize {}



// MARK: - 🚩 Extension_StringNSAttributedString

/// 🍵 使用富文本在一个字符串中表现出不同颜色和字体
///
/// eg: let colorStr = "美丽的中国"
///     colorStr.cn_setAttributedString(colors: [String], fonts: [CGFloat], texts: [String])
///
/// func cn_setAttributedString(colors: [String], fonts: [CGFloat], texts: [String]) -> NSAttributedString {}

// MARK: - 🚩 Extension_UIView

/// 🍵 初始化一个View
///
/// eg: let vie = UIView.cn_initViewWith(background: UIColor, radii: CGFloat)
///
/// static func cn_initViewWith(background: UIColor = .white, radii: CGFloat = 0.0) -> UIView {}

/// 🍵 得到或设置View的宽、高、x、y、size
///
/// eg: print(vie.cn_width)
///
/// var cn_width: CGFloat {}
/// var cn_height: CGFloat {}
/// var cn_x: CGFloat {}
/// var cn_y: CGFloat {}
/// var cn_size: CGSize {}
///
/// static func cn_initViewWith(background: UIColor = .white, radii: CGFloat = 0.0) -> UIView {}

/// 🍵 移除所有子视图
///
/// eg: vie.cn_removeSubviews()
///
/// func cn_removeSubviews() {}

/// 🍵 添加点击手势
///
/// eg: vie.cn_addTapGesture(target: self, action: #selector(self.eat))
///
/// func cn_addTapGesture(target: Any, action: Selector) {}

/// 🍵 添加点击手势
///
/// eg: vie.cn_addTapGesture { (ges) in ... }
///
/// func cn_addTapGesture(_ block: ((UIGestureRecognizer)->Void)?) {}

/// 🍵 添加长按手势
///
/// eg: vie.cn_addLongGesture { (ges) in ... }
///
/// func cn_addLongGesture(_ block: ((UIGestureRecognizer)->Void)?) {}

/// 🍵 添加轻扫手势
///
/// eg:
///     self.view.cn_addSwipeGesture(direction: .right) { (ges) in
///        self.navigationController?.popViewController(animated: true)
///     }
///
/// func cn_addSwipeGesture(direction: UISwipeGestureRecognizer.Direction, _ block: ((UIGestureRecognizer)->Void)?) {}

/// 🍵 移除所有手势
///
/// eg: vie.cn_removeGestures()
///
/// func cn_removeGestures() {}

/// 🍵 取消键盘
///
/// eg: vie.cn_dismissKeyboard()
///
/// func cn_dismissKeyboard() {}

/// 🍵 截取UIView对象返回一张图片
///
/// eg: let image = vie.cn_snapshotImage()
///
/// func cn_snapshotImage() -> UIImage? {}

/// 🍵 绘制虚线
///
/// length : 线长
/// spacing: 间隔
/// color  : 颜色
///
/// eg: vie.cn_drawDashLine(length: Int, spacing: Int, color: UIColor)
///
/// func cn_drawDashLine(length: Int, spacing: Int, color: UIColor) {}

/// 🍵 设置渐变色
///
/// eg:
///     vie.cn_setGradientColor(colors: [CGColor], startPoint:      UIView.GradientColorPoint, endPoint: UIView.GradientColorPoint)
///
/// func cn_setGradientColor(colors: [CGColor], startPoint: GradientColorPoint, endPoint: GradientColorPoint) {}
///
/// enum GradientColorPoint {
///     case left
///     case leftTop
///     case leftBottom
///     case right
///     case rightTop
///     case rightBottom
///     case top
///     case bottom
/// }

/// 🍵 给视图添加模糊的效果
///
/// eg: vie.cn_blurry(withStyle: UIBlurEffect.Style)
///
/// func cn_blurry(withStyle style: UIBlurEffect.Style = .light) {}

/// 🍵 给视图设置阴影
///
/// color: 阴影颜色
/// offset: 阴影偏移量
/// opacity: 透明度
/// radius: 阴影半径
///
/// eg:
///     vie.func cn_setShadow(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {}
///
/// func cn_setShadow(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {}

/// 🍵 设置所有角
///
/// eg: vie.cn_setAllCorners(radii: CGFloat)
///
/// func cn_setAllCorners(radii: CGFloat = 0.0) {}

/// 🍵 设置部分角
///
/// eg:
///     vie.cn_setSomeCorners(corners_after: CACornerMask, corners_before: UIRectCorner, radii: CGFloat)
///
/// func cn_setSomeCorners(corners_after: CACornerMask, corners_before: UIRectCorner, radii: CGFloat) {}

/// 🍵 设置边框
///
/// eg: vie.cn_setBorder(width: CGFloat, color: UIColor)
///
/// func cn_setBorder(width: CGFloat, color: UIColor) {}

/// 🍎 动画 🍎
/// 🍵 闪动动画
///
/// 文字放大和缩小
///
/// eg: vie.cn_peekAnimation()
///
/// func cn_peekAnimation() {}

/// 🍵 抖动动画
///
/// 比如：当输入数量小于1时
///
/// eg: vie.cn_shakeAnimation()
///
/// func cn_shakeAnimation() {}

/// 🍵 弹簧动画
///
/// withDuration: 时长
/// usingSpringWithDamping: 0~1.0 越大月不明显
/// animations: 动画
/// completion: 回调
///
/// eg:
///     vie.cn_springAnimation(withDuration: TimeInterval, usingSpringWithDamping: CGFloat) {
///           ...
///     } completion: { (finish) in
///           ...
///     }
///
/// func cn_springAnimation(withDuration: TimeInterval, usingSpringWithDamping: CGFloat, animations: (()->Void)?, completion: ((Bool)->Void)? = nil) {}

// MARK: - 🚩 Extension_UILabel

/// 🍵 初始化一个UILabel
///
/// eg:
///     let label = UILabel.cn_initWith(background: UIColor.white, text: "xxx", textColor: UIColor.flatRed(), font: UIFont.cn_fontSize(ofSize: 14), alignment: .center, numberOfLines: 1)
///
/// static func cn_initWith(background: UIColor = .white, text: String, textColor: UIColor, font: UIFont, alignment: NSTextAlignment = .left, numberOfLines: Int = 1, lineSpacing: CGFloat?) -> UILabel {}

/// 🍵 是否拥有复制功能
///
/// eg: label.cn_isCopyable = true
///
/// var cn_isCopyable: Bool? {}

// MARK: - 🚩 Extension_UIButton

/// 🍵 添加点击事件
///
/// eg: btn.cn_addTarget {  code  }
///
/// func cn_addTarget(events: UIControl.Event = .touchUpInside, block: @escaping()->Void) {}

/// 🍵 设置button的文字和图片（默认图片在左，文字在右）
///
/// eg: btn.cn_setTitleAndImage(title: String?, titleColor: UIColor?, image: UIImage?)
///
/// func cn_setTitleAndImage(title: String?, titleColor: UIColor?, image: UIImage?) {}

/// 🍵 设置button的文字
///
/// eg: btn.cn_setTitle(normal: String, selected: String?)
///
/// func cn_setTitle(normal: String, selected: String?) {}

/// 🍵 设置button的文字颜色
///
/// eg: btn.cn_setTitleColor(normal: UIColor, selected: UIColor?)
///
/// func cn_setTitleColor(normal: UIColor, selected: UIColor?) {}

/// 🍵 设置button的image
///
/// eg: btn.cn_setImage(normal: UIImage, selected: UIImage?)
///
/// func cn_setImage(normal: UIImage, selected: UIImage?) {}

/// 🍵 设置button的字体
///
/// eg: btn.cn_setFont(font: UIFont)
///
/// func cn_setFont(font: UIFont) {}

/// 🍵 设置image  到所有的状态
///
/// eg: btn.cn_setImageForAllStates(UIImage)
///
/// func cn_setImageForAllStates(_ image: UIImage) {}

/// 🍵 设置文字 到所有的状态
///
/// eg: btn.cn_setTitleForAllStates(String)
///
/// func cn_setTitleForAllStates(_ title: String) {}

/// 🍵 设置文字颜色 到所有的状态
///
/// eg: btn.cn_setTitleColorForAllStates(UIColor)
///
/// func cn_setTitleColorForAllStates(_ color: UIColor) {}

/// 🍵 设置间隔（样式一：图片在上，文字在下，默认样式二：图片在左，文字在右）
/// 默认图片在左，文字在右，imageAboveText == true时，图片在文字上方，否则正常模式
///
/// eg: btn.cn_setImageAboveText(imageAboveText: Bool, spacing: CGFloat)
///
/// func cn_setImageAboveText(imageAboveText: Bool = false, spacing: CGFloat) {}

// MARK: - 🚩 Extension_UIImageView

/// 🍵 初始化一个UIImageView
///
/// eg: let imageView = UIImageView.cn_initWith(named: "xxx")
///
/// func cn_download(
///     from url: String,
///     contentMode: UIView.ContentMode = .scaleAspectFit,
///     placeholder: UIImage? = nil,
///     completionHandler: ((UIImage?) -> Void)? = nil) {}

/// 🍵 设置网络图片
///
/// eg: let imageView = UIImageView.cn_initWith(named: "xxx")
///
/// static func cn_initWith(background: UIColor = UIColor.clear, named: String) -> UIImageView {}

// MARK: - 🚩 Extension_UIImage

/// 🍵 根据多个颜色生成一个渐变色的image
///
/// eg: let image = UIImage.cn_generateGradientImageFrom(color: [UIColor])
///
/// static func cn_generateGradientImageFrom(color: [UIColor]) -> UIImage {}

/// 🍵 根据颜色色值生成一个image
///
/// eg: let image = UIImage.cn_generateImageFrom(color: UIColor.blue)
///
/// static func cn_generateImageFrom(color: UIColor) -> UIImage {}

/// 🍵 改变图片的颜色，生成一个新的image
///
///
/// eg:
///     let oldImage = UIImage(named: "xxx")
///     let newImage = oldImage.cn_changeImageColorForImage(_ newColor: UIColor, blendMode: CGBlendMode = CGBlendMode.destinationIn, alpha: CGFloat = 1.0)
///
/// func cn_changeImageColorForImage(_ newColor: UIColor, blendMode: CGBlendMode = CGBlendMode.destinationIn, alpha: CGFloat = 1.0) -> UIImage {}

/// 🍵 修改图片的size，生成一个新的image
///
///
/// eg:
///     let oldImage = UIImage(named: "xxx")
///     let newImage = oldImage.cn_changeImageSizeForImage(size: CGSize)
///
/// func cn_changeImageSizeForImage(size: CGSize) -> UIImage {}

/// 🍵 压缩图片，生成Data
///
///
/// eg:
///     let oldImage = UIImage(named: "xxx")
///     let data = oldImage.cn_compressImageForData(maxLengh: CGFloat, maxKB : CGFloat)
///
/// func cn_compressImageForData(maxLengh: CGFloat, maxKB : CGFloat) -> Data {}

// MARK: - 🚩 Extension_UISwitch

/// 🍵 初始化一个UISwitch
///
/// eg: let swi = UISwitch.cn_initWith(isOn: false, onColor: UIColor.red, thumbColor: nil, scale: 1.0)
///
/// static func cn_initWith(isOn: Bool, onColor: UIColor?, thumbColor: UIColor?, scale: CGFloat) -> UISwitch {}

/// 🍵 设置UISwitch的image
///
/// eg: swi.cn_setImage(onImage: UIImage(named: ""), offImage: UIImage(named: ""))
///
/// func cn_setImage(onImage: UIImage?, offImage: UIImage?) {}

/// 🍵 toggle开关, 开则关，关则开
///
/// eg: swi.cn_toggleSwitch()
///
/// func cn_toggleSwitch() {}

// MARK: - 🚩 Extension_UITextField

/// 🍵 推荐 使用CNUITextField初始化
///
/// 🍵 UITextField 是否有值
///
/// eg: print(texF.cn_isEmpty)
///
/// var cn_isEmpty: Bool {}

/// 🍵 UITextField 清除文本
///
/// eg: texF.cn_clean()
///
/// func cn_clean() {}

/// 🍵 UITextField 设置占位符文本颜色
///
/// eg: texF.cn_setPlaceholderColor(color: UIColor(hexString: "#333333"))
///
/// func cn_setPlaceholderColor(color: UIColor) {}

/// 🍵 UITextField 在左侧设置填充视图增加间距
///
/// eg: texF.cn_addPaddingToLeft(10.0)
///
/// func cn_addPaddingToLeft(_ padding: CGFloat) {}

/// 🍵 UITextField 设置leftView是图片的颜色
///
/// eg: texF.cn_leftViewTintColor = UIColor.red
///
/// var cn_leftViewTintColor: UIColor? {}

/// 🍵 UITextField 设置rightView是图片的颜色
///
/// eg: texF.cn_rightViewTintColor = UIColor.red
///
/// var cn_rightViewTintColor: UIColor? {}

/// 🍎🍎🍎🍎🍎

// MARK: - 🚩 Extension_UITableView

/// 🍵 初始化一个UITableView
///
/// eg:
///     let tab = UITableView.cn_initWith(background: .hex_F5F5F8, style: .plain, lineStyle: .singleLine, lineInset: (left: 10, right: 10), lineColor: UIColor.hex_EEEEEE)
///
/// static func cn_initWith(background: UIColor = .white, style: UITableView.Style, lineStyle:       UITableViewCell.SeparatorStyle, lineInset: (left: CGFloat, right: CGFloat)?, lineColor: UIColor?, showsIndicator: Bool = false) -> UITableView {}

/// 🍵 注册cell 使用类名作为标识符
///
/// eg: tab.cn_registerCell(cls: MallSetting_Cell.self)
///
/// func cn_registerCell(cls: AnyClass) {}

/// 🍵 获取重用的cell
///
/// eg: let cell = tableView.dequeueReusableCell(withClass: MallSetting_Cell.self, for: indexPath)
///
/// func cn_dequeueReusableCell<T> (cls: T.Type, for indexPath: IndexPath) -> T {}

/// 🍵 注册SectionHeaderFooterView 使用类名作为标识符
///
/// eg: tab.cn_registerSectionHeaderFooterView(cls: MallSetting_SectionHeaderView.self)
///
/// func func cn_registerSectionHeaderFooterView(cls: AnyClass) {}

/// 🍵 获取重用的SectionHeaderFooterView
///
/// eg: let view = tableView.cn_dequeueReusableSectionHeaderFooterView(withClass: MallSetting_SectionHeaderView.self, for: indexPath)
///
/// func cn_dequeueReusableSectionHeaderFooterView<T> (cls: T.Type, for indexPath: IndexPath) -> T {{}


/// 🍵 移除 TableHeaderView 和 TableFooterView
///
/// eg: tab.cn_removeTableHeaderView()
///
/// func cn_removeTableHeaderView() {}
/// func cn_removeTableFooterView() {}

/// 🍵 刷新
///
/// eg: tab.cn_reloadData { ... }
///
/// func cn_reloadData(_ completion: @escaping () -> Void) {}

/// 🍵 Scroll to top 和 Scroll to bottom
///
/// eg: tab.cn_scrollToTop()
///
/// func cn_scrollToTop(animated: Bool = true) {}
/// func cn_scrollToBottom(animated: Bool = true) {}

/// 🍵 检查IndexPath在tableView中是否有效
///
/// eg: if tab.cn_isValidIndexPath == true { ... }
///
/// func cn_isValidIndexPath(_ indexPath: IndexPath) -> Bool {}

/// 🍵 安全地滚动到可能无效的IndexPath
///
/// eg: tab.cn_safeScrollToRow(at: IndexPath, at: UITableView.ScrollPosition, animated: Bool)
///
/// func cn_safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {}

// MARK: - 🚩 Extension_UICollectionView

/// 🍵 初始化一个UICollectionView
///
/// eg:
///     let collectView = UICollectionView.cn_initWith(background: UIColor, direction: UICollectionView.ScrollDirection, itemSize: CGSize, lineSpacing: CGFloat, interitemSpacing: CGFloat)
///
/// static func cn_initWith(background: UIColor = .white, direction: UICollectionView.ScrollDirection = .vertical, itemSize: CGSize, lineSpacing: CGFloat, interitemSpacing: CGFloat) -> UICollectionView {}

/// 🍵 注册cell 使用类名作为标识符
///
/// eg: collectView.cn_registerCell(cls: MyCenter_CollectionViewCell.self)
///
/// func cn_registerCell(cls: AnyClass) {}

/// 🍵 获取重用的cell
///
/// eg:
///     let cell = collectionView.cn_dequeueReusableCell(cls: MyCenter_CollectionViewCell.self, for: indexPath)
///
/// func cn_dequeueReusableCell<T> (cls: T.Type, indexPath: IndexPath) -> T {}

/// 🍵 注册header 使用类名作为标识符
///
/// eg:  collectView.cn_registerHeader(cls: MyCenter_SectionHeaderReusableView.self)
///
/// func cn_registerHeader(cls: AnyClass) {}

/// 🍵 获取重用的header
///
/// eg:  let sectionhHaderView = collectionView.cn_dequeueReusableHeader(cls: MyCenter_SectionHeaderReusableView.self, for: indexPath)
///
/// func cn_dequeueReusableHeader<T> (cls: T.Type, indexPath: IndexPath) -> T {}

/// 🍵 注册footer 使用类名作为标识符
///
/// eg:  collectView.cn_registerFooter(cls: MyCenter_SectionFooterReusableView.self)
///
/// func cn_registerFooter(cls: AnyClass) {}

/// 🍵 获取重用的footer
///
/// eg:  let sectionFooterView = collectionView.cn_dequeueReusableFooter(cls: MyCenter_SectionFooterReusableView.self, for: indexPath)
///
/// func cn_dequeueReusableFooter<T> (cls: T.Type, indexPath: IndexPath) -> T {}


/// func collectionView(_ collectionView: UICollectionView,    viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) ->  UICollectionReusableView {
///     var reusableview: UICollectionReusableView!
///     if kind == UICollectionView.elementKindSectionHeader
///     {
///         let sectionhHaderView = collectionView.cn_dequeueReusableHeader(cls: MyCenter_SectionHeaderReusableView.self, for: indexPath)
    
///         reusableview = sectionhHaderView
///     }
///     else if kind == UICollectionView.elementKindSectionFooter
///     {
///         let sectionFooterView = collectionView.cn_dequeueReusableFooter(cls: MyCenter_SectionFooterReusableView.self, for: indexPath)
///
///         reusableview = sectionFooterView
///     }
///
///     return reusableview
///
///     }

// MARK: - 🚩 Extension_Date

/// 🍵 现在中国日期时间
///
/// eg: print(Date.cn_date)
///
/// static var cn_date: Date {}

/// 🍵 现在中国日期戳
///
/// eg: print(Date.cn_timeStamp)
///
/// static var cn_timeStamp: Int {}

/// 🍵 日期的年
///
/// eg: print(Date().cn_year)
///
/// var cn_year: String {}

/// 🍵 日期的月
///
/// eg: print(Date().cn_month)
///
/// var cn_month: String {}

/// 🍵 日期的日
///
/// eg: print(Date().cn_day)
///
/// var cn_day: String {}

/// 🍵 日期是星期几
///
/// eg: print(Date().cn_weekDay)
///
/// var cn_weekDay: String {}

/// 🍵 日期月份有多少天
///
/// eg: print(Date().cn_monthDays)
///
/// var cn_monthDays: String {}

/// 🍵 日期月份第一天是星期几
///
/// eg: print(Date().cn_monthFirstDayisWeek)
///
/// var cn_monthDays: String {}

/// 🍵 日期月份的下月最后一天的日期
///
/// eg: print(Date().cn_nextMonthLastDayDate)
///
/// var cn_nextMonthLastDayDate: String {}

/// 🍵 日期字符串转Date
///
/// eg: "yyyy-MM-dd"
///     Date.cn_getDateFrom(dateStr: "2021-01-05", dateFormat: "yyyy-MM-dd")
///
/// static func cn_getDateFrom(dateStr: String, dateFormat: String) -> Date? {}

/// 🍵 Date转日期字符串
///
/// eg:
///     Date.cn_getStringFromDate(dateStr: "2021-01", dateFormat: "yyyy-MM-dd")
///
///
/// static func cn_getStringFrom(date: Date, dateFormat: String) -> String? {}

/// 🍵 根据年月得到某月天数
///
/// eg:
///     Date.cn_getMonthDays(year: "2021", month: "01")
///
///
/// static func cn_getMonthDays(year: String, month: String) -> String {}

/// 🍵 根据年月得到某月第一天是周几
///
/// eg:
///     Date.cn_getMonthFirstDayisWeek(year: "2021", month: "01")
///
///
/// static func cn_getMonthFirstDayisWeek(year: String, month: String) -> String {}

/// 🍵 计算两个日期之间的天数
///
/// yyyy年MM月dd日 或 yyyy-MM-dd
///
/// eg:
///     Date.cn_getDaysBetweenDate(date_1: "2021-01-10", date_2: "2021-01-11", dateFormat: "yyyy-MM-dd")
///
///
/// static func cn_getDaysBetweenDate(date_1: String, date_2: String, dateFormat: String) -> Int {}

/// 🍵 计算两个日期之间的天数
///
/// eg:
///     Date.cn_getDaysBetweenDate(fromeDate: Date, toDate: Date)
///
///
/// static func cn_getDaysBetweenDate(fromeDate: Date, toDate: Date) -> Int {}

/// 🍵 计算两个日期之间的小时数
///
/// eg:
///     Date.cn_getHoursBetweenDate(fromeDate: Date, toDate: Date)
///
///
/// static func cn_getHoursBetweenDate(fromeDate: Date, toDate: Date) -> Int {}

/// 🍵 计算两个日期之间的分钟数
///
/// eg:
///     Date.cn_getMinutesBetweenDate(fromeDate: Date, toDate: Date)
///
///
/// static func cn_getMinutesBetweenDate(fromeDate: Date, toDate: Date) -> Int {}

/// 🍵 将时间转换为时间戳
///
/// "yyyy-MM-dd HH:mm:ss"
///
/// eg:
///     Date.cn_getTimeStampFrom(dateStr: String, dateFormat: String)
///
///
/// static func cn_getTimeStampFrom(dateStr: String, dateFormat: String) -> Int {}

/// 🍵 将时间戳转换为具体时间
///
/// yyyy年MM月dd日 HH:mm:ss
/// yyyy-MM-dd HH:mm:ss
/// HH:mm:ss
///
/// eg:
///     Date.cn_getDateStrFrom(timeStamp: String, dateFormat: String)
///
///
/// static func cn_getDateStrFrom(timeStamp: String, dateFormat: String) -> String {}

/// 🍵 比较两个日期之间的先后
///
/// ComparisonResult：
///   orderedAscending， 早于
///   orderedSame，      等于
///   orderedDescending，晚于
///
/// eg:
///     if date1.cn_compareBetweenDate(otherDate: date2) == .orderedAscending { }
///
/// func cn_compareBetweenDate(otherDate: Date) -> ComparisonResult {}

/// 🍵 数字转月份
///
/// eg:
///     print(Date.cn_getMonthFrom(num: 1))
///
///
/// static func cn_getMonthFrom(num: Int) -> String {}

/// 🍵 将时间显示为（几分钟前，几小时前，几天前）
///
/// eg:
///     print(Date.cn_getAgoTextFromNow(time: "2021-01-10", dateFormat: "yyyy-MM-dd"))
///
///
/// static func cn_getAgoTextFromNow(time: String, dateFormat: String) -> String {}

/// 🍵 通过添加年或月或日，得到一个新的日期
///
/// eg:
///     let date = Date.cn_getNewDateByAdding(year: Int, month: Int, day: Int)
///     print("\(date)")
///
///
/// static func cn_getNewDateByAdding(year: Int, month: Int, day: Int) -> Date? {}
