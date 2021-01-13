//
//  CNUISearchBar.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: 初始化自定义样式的 UISearchBar
///
///
///

public class CNUISearchBar: UISearchBar {
    
    public var searchBarBeginEditingBlock: ((String) -> Void)?
    public var searchBarSearchClickBlock: ((String) -> Void)?
    
    // MARK: Properties
    private var didClickSearch = false
    
    public convenience init(backgroundColor: UIColor?, backgroundImage: UIImage?, leftImage: String, InputBackgroundImage: UIImage?, InputBackgroundColor: UIColor, placeholderText: String, placeholderColor: String, placeholderFont: UIFont, InputFont: UIFont, InputTextColor: UIColor,  tfCorner: CGFloat, tfBorderWidth: CGFloat, tfBorderColor: UIColor, tfHeight: CGFloat, cursorColor: UIColor?, iconPosition: UIOffset, textPosition: UIOffset) {
        self.init()
        
        self.delegate = self
        self.sizeToFit()
        /// SearchBar 背景色，不包含输入框
        self.backgroundColor = backgroundColor
        /// SearchBar 背景图，不包含输入框
        self.setBackgroundImage(backgroundImage, for: .any, barMetrics: .default)
        /// SearchField 背景图，也可以用 searchTextField.background/textFiled.background 都是设置背景图的
        self.setSearchFieldBackgroundImage(InputBackgroundImage, for: .normal)
        /// 设置左侧图标
        self.setImage(UIImage(named: leftImage), for: UISearchBar.Icon.search, state: UIControl.State.normal)
        /// 改变左边图标坐标位置 UIOffsetMake(60, 0)
        self.setPositionAdjustment(iconPosition, for: UISearchBar.Icon.search)
        /// 改变文本坐标位置
        self.searchTextPositionAdjustment = textPosition
        /// 去掉上下黑线
        self.backgroundImage = UIImage()
        /// 光标颜色
        if cursorColor != nil {
            self.tintColor = cursorColor // 或者 textFiled.tintColor = UIColor.white
        }
        /// 想要设置里面的圆角只能这样
        if #available(iOS 13.0, *) {
            /// 不用 self.placeholder = "搜索"
            searchTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor, NSAttributedString.Key.font: placeholderFont])
            searchTextField.backgroundColor = InputBackgroundColor
            setSearchFieldBackgroundImage(InputBackgroundImage, for: .normal)
            searchTextField.font = InputFont
            searchTextField.textColor = InputTextColor
            searchTextField.layer.borderWidth = tfBorderWidth
            searchTextField.layer.borderColor = tfBorderColor.cgColor
            searchTextField.frame.size.height = tfHeight
            searchTextField.layer.cornerRadius = tfCorner
            searchTextField.clipsToBounds = true
        } else {
            let textFiled = value(forKey: "searchField") as! UITextField
            /// 不用 self.placeholder = "搜索"
            textFiled.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor, NSAttributedString.Key.font: placeholderFont])
            textFiled.backgroundColor = InputBackgroundColor
            textFiled.font = InputFont
            textFiled.textColor = InputTextColor
            textFiled.layer.borderWidth = tfBorderWidth
            textFiled.layer.borderColor = tfBorderColor.cgColor
            textFiled.frame.size.height = tfHeight
            textFiled.layer.cornerRadius = tfCorner
            textFiled.clipsToBounds = true
        }
        //
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
// MARK: Extension
extension CNUISearchBar: UISearchBarDelegate {
    
    // 将要开始编辑
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    // 已经开始编辑
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) { }
    // 将要结束编辑
    public func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    // 已经结束编辑
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {    }
    // 内容已经改变
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if didClickSearch == false { }
        else {
            if searchBar.text! == "" && self.searchBarBeginEditingBlock != nil {
                self.searchBarBeginEditingBlock!(searchBar.text!)
                didClickSearch = false
            }
        }
        
    }
    //  编辑文字改变前的回调，返回NO则不能加入新的文字
    public func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    // 取消按钮点击
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
    }
    // 搜索按钮点击
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        didClickSearch = true
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        if searchBarSearchClickBlock != nil {
            
            self.searchBarSearchClickBlock!(searchBar.text!)
        }
        
    }
    // 书本按钮点击的回调
    public func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        
    }
    // 搜索结果按钮点击的回调
    public func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        
    }
    // 搜索栏的附加试图中切换按钮触发的回调
    public func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
}

/*
 self.searchBarStyle = .minimal
 self.sizeToFit()

//        searchBar.showsCancelButton = true  或 searchBar.setShowsCancelButton(true, animated: true)
//        searchBar.showsScopeBar = true
 
//        let btn = searchBar.value(forKey: "searchButton") as! UIButton
//        btn.setTitle("搜索", for: UIControl.State.normal)
//        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
//        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)

 设置搜索栏中图片的位置偏移，图片的枚举如下：
 typedef NS_ENUM(NSInteger, UISearchBarIcon) {

     UISearchBarIconSearch, //搜索图标

     UISearchBarIconClear, // 清除图标

     UISearchBarIconBookmark, // 书本图标

     UISearchBarIconResultsList, // 结果列表图标

 };
 下面是搜索框控件的一些代理方法：

 - (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;

 将要开始编辑时的回调，返回为NO，则不能编辑

 - (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;

 已经开始编辑时的回调

 - (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar;

 将要结束编辑时的回调

 - (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;

 已经结束编辑的回调

 - (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;   编辑文字改变的回调

 - (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text ;

 编辑文字改变前的回调，返回NO则不能加入新的编辑文字

 - (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;

 搜索按钮点击的回调

 - (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar;

 书本按钮点击的回调

 - (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar;

 取消按钮点击的回调

 - (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar;

 搜索结果按钮点击的回调

 - (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope;

 搜索栏的附加试图中切换按钮触发的回调

 */
