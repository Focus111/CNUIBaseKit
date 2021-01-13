//
//  Note_Tools.swift
//  CNUIKitSDK
//
//  Created by Mac on 2021/1/6.
//

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

// MARK: - 🍎 CN_HUD
///
///
///
/// 对UIView进行了扩展：
///
/// eg:
///     self.view.showLoading()
///
/// func showLoading(animation: String = "elephantRunning") {}
/// func hideLoading() {}
/// func showTips(backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.7), title: String, titleColor: UIColor = UIColor.white) {}


// MARK: - 🍎 CN_BaseNavController
///
/// 基础导航栏
///

/// 🍵 导航栏返回事件:
///
/// eg:
///     (self.navigationController as? CN_BaseNavController)!.cn_backBlock = {
///         self.navigationController?.popToRootViewController(animated: true)
///     }
///
/// (self.navigationController as? CN_BaseNavController)!.cn_backBlock = {}

// MARK: - 🍎 CN_BaseController
///
/// 基础控制器
///

/// 🍵 导航栏设置:
///
/// eg:
///
/// public var cn_hideNavigationBar: Bool? = nil {}
/// public var cn_backgroundColor:   UIColor? = nil {}
/// public var cn_hidesNavigationBarHairline: Bool? = nil {}
/// public var cn_barTintColor: UIColor? {}
/// public var cn_barTintImage: UIImage? {}
/// public var cn_barTitleColor: UIColor? {}
/// public var cn_barTitleFont: UIFont? {}
/// public var cn_barButtonItemTitleColor: UIColor? {}
/// public var cn_barButtonItemTitleFont : UIFont? {}
/// public var backIndicatorImage: UIImage? {}
///



// MARK: - 🍎 CN_Location

/// 🍵 实时获取经纬度
///
/// eg:
///     CN_Location.shared.startLocation(Gaode_apiKey: "ba93c434e092aaac88ce8899406ec693", controller: self)
///     CN_Location.shared.updateCoordinateBlock = { (long, lat) -> Void in
///
///     }
///
/// public var updateCoordinateBlock: ((_ longitude: String, _ latitude: String)->())?

/// 🍵 实时获取详细地址
///
/// eg:
///     CN_Location.shared.startLocation(Gaode_apiKey: "ba93c434e092aaac88ce8899406ec693", controller: self)
///     CN_Location.shared.updateAddressBlock = { (address) -> Void in
///
///     }
///
/// public var updateAddressBlock: ((_ address: String)->())?

/// 🍵 开始定位
///
/// eg:
///     CN_Location.shared.startLocation(Gaode_apiKey: "ba93c434e092aaac88ce8899406ec693", controller: self)
///
/// public func startLocation(Gaode_apiKey: String, controller: UIViewController) {}

/// 🍵 停止定位
///
/// eg:
///     CN_Location.shared.stopLocation()
///
/// public func stopLocation() {}


// MARK: - 🍎 CN_Json

/// 🍵 JSONString转字典
///
/// eg:
///     print(CN_Json.getDictFromJsonStr(JsonStr: String))
///
/// public static func getDictFromJsonStr(JsonStr: String) -> Dictionary {}

/// 🍵 String转JSONString
///
/// eg:
///     print(CN_Json.getJsonStrFromStr(JsonStr: String))
///
/// public static func getJsonStrFromStr(str: String) -> String {}

/// 🍵 Dictionary转JSONString
///
/// eg:
///     print(CN_Json.getJsonStrFromDict(JsonStr: String))
///
/// public static func getJsonStrFromDict(dict: Dictionary) -> String {}

/// 🍵 Array转JSONString
///
/// eg:
///     print(CN_Json.getJsonStrFromArray(JsonStr: String))
///
/// public static func getJsonStrFromArray(array: Array<Any>) -> String {}

// MARK: - 🍎 CN_VideoHelper

/// 🍵 抓取视频中的截图，可以作为封面
///
/// eg:
///     CN_VideoHelper.thumbImageFrom(url: URL(string: singleMaterialModel.upload_file[0])!) { (image) in
///         imageView.image = image
///     }
///
/// public class func thumbImageFrom(url: URL, image: @escaping (UIImage?) -> ()) {}

// MARK: - 🍎 CN_ShowHelper

/// 🍵 放大展示图片
///
/// eg:
///     CN_ShowHelper.show(imageView: self.doorImg)
///
/// static func show(imageView: UIImageView) {}


// MARK: - 🍎 CN_PopupImageView

/// 🍵 一张图片占据整个屏幕, 点击图片返回
///
/// 可以设置: 网络图片、图片的size、默认图片
/// eg:
///    let ruleView = CN_PopupImageView()
///    ruleView.url = "......"
///    ruleView.placeHolder = UIImage(named: "MyCenter_VipRemind")
///    ruleView.cgSize = CGSize(width: cn_scale(205.0), height: cn_scale(236.0))
///    ruleView.show_Event()
///
/// public func show_Event() {}

// MARK: - 🍎 CNUILabel

/// 🍵 初始化多种样式的label
///
/// eg: private let realPrice: CNUILabel = {
///         let label = CNUILabel(labelType: .moreFont)
///         label.labelText = "¥NA"
///         label.textColor = UIColor(hexString: "#FF7531")
///         label.font = UIFont.cn_fontSize(ofSize: 20)
///         label.fontStartLocation = 0
///         label.fontLength = 1
///         label.fontValue = UIFont.cn_fontSize(ofSize: 20)
///         return label
///     }()
///
/// .middleLine
///  >> labelText、colorLine
///
/// .bottomLine
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
///
/// public init(frame: CGRect = .zero, labelType: CNUILabelType) {}

// MARK: - 🍎 CNUILoadingLabel

/// 🍵 点击label加载转圈动画
///
/// eg:
///     let label = CNUILoadingLabel.init(background: UIColor.white, text: "xxx", textColor: UIColor.flatRed(), font:   UIFont.cn_fontSize(ofSize: 14), alignment: .center, numberOfLines: 1, strokeColor: UIColor.red)
///
///     loginLabel.click = { () -> Void in
///         self.login_Event()
///     }
///
///     label.stop = true
///
/// public init(background: UIColor = .white, text: String, textColor: UIColor, font: UIFont, alignment: NSTextAlignment = .left, numberOfLines: Int = 1, lineSpacing: CGFloat? = nil, strokeColor: UIColor? = UIColor.white) {}
///
/// public var clickBlock: (()->())?  点击触发事件
/// public var stop: Bool? {}  控制停止，stop == true就会停止

// MARK: - 🍎 CNUIButton

/// 🍵 初始化多种样式的 UIButton
///
/// eg: private let banner: CNUIButton = {
///         let btn = CNUIButton()
///         btn.btnType = .leftImgRightTitle
///         btn.spacing = 6
///         btn.setImage(UIImage(named: "Banner_Login")!, for: .normal)
///         btn.setTitle("xxx", for: .normal)
///         btn.setTitleColor(UIColor.Color_LogoTitleColor, for: .normal)
///         btn.titleLabel?.font = UIFont.cn_fontSize(ofSize: 24)
///         btn.isEnabled = false
///         return btn
///     }()
///
/// public var btnType = CNUIButtonType.leftImgRightTitle
/// public var spacing: CGFloat = 0
///
/// public enum CNUIButtonType {
///     case leftImgRightTitle
///     case leftTitleRightImg
///     case topTitleBottomImg
///     case topImgBottomTitle
/// }

// MARK: - 🍎 CNUIButton_ImageUrl

/// 🍵 初始化多种样式的 UIButton(自定义了View)
///
/// eg: private let btn: CNUIButton_ImageUrl = {
///         let btn = CNUIButton_ImageUrl()
///         btn.btnType = .leftImgRightTitle
///         btn.spacing = 6
///         return btn
///     }()
///
/// eg: btn.setImageUrl_CN(imageUrl: String, placeImage: UIImage? = nil, state: UIControl.State = .normal)
///
/// public var btnType = CNUIButton_ImageUrlType.leftImgRightTitle
/// public var spacing: CGFloat = 0
///
/// public enum CNUIButton_ImageUrlType {
///     case leftImgRightTitle
///     case leftTitleRightImg
///     case topTitleBottomImg
///     case topImgBottomTitle
/// }

// MARK: - 🍎 CNUITextField

/// 🍵 根据要输入的内容类型
///
/// eg: private let texField: CNUITextField = {
///         let texF = CNUITextField(text: String, textColor: UIColor, textFont: UIFont, placeholderText: String?, placeholderColor: UIColor?, placeholderFont: UIFont?, cursorColor: UIColor?, textContentType: UITextContentType?, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType, alignment: NSTextAlignment)
///
///         texF.inputType = .money
///     }()
///
/// eg: texField.endInputBlock = { (text) -> Void in ...}
///
/// public enum CNUITextFieldInputType {
///     case normal
///     case money
///     case money_leftView
///     case phone
/// }
///
/// public var endInputBlock: ((String)->())?
///
/// public convenience init(text: String, textColor: UIColor, textFont: UIFont, placeholderText: String?, placeholderColor: UIColor?, placeholderFont: UIFont?, cursorColor: UIColor?, textContentType: UITextContentType?, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType, alignment: NSTextAlignment) {}

// MARK: - 🍎 CNUISearchBar

/// 🍵 初始化自定义样式的 UISearchBar
///
/// eg: let sear = CNUISearchBar(backgroundColor: UIColor?, backgroundImage: UIImage?, leftImage: String, InputBackgroundImage: UIImage?, InputBackgroundColor: UIColor, placeholderText: String, placeholderColor: String, placeholderFont: UIFont, InputFont: UIFont, InputTextColor: UIColor, tfCorner: CGFloat, tfBorderWidth: CGFloat, tfBorderColor: UIColor, tfHeight: CGFloat, cursorColor: UIColor?, iconPosition: UIOffset, textPosition: UIOffset)
///
/// eg: sear.searchBarBeginEditingBlock = { (text) -> Void in ...}
/// eg: sear.searchBarSearchClickBlock = { (text) -> Void in ...}
///
/// public var searchBarBeginEditingBlock: ((String) -> Void)?
/// public var searchBarSearchClickBlock: ((String) -> Void)?
///
/// public convenience init(backgroundColor: UIColor?, backgroundImage: UIImage?, leftImage: String, InputBackgroundImage: UIImage?, InputBackgroundColor: UIColor, placeholderText: String, placeholderColor: String, placeholderFont: UIFont, InputFont: UIFont, InputTextColor: UIColor,  tfCorner: CGFloat, tfBorderWidth: CGFloat, tfBorderColor: UIColor, tfHeight: CGFloat, cursorColor: UIColor?, iconPosition: UIOffset, textPosition: UIOffset) {}

