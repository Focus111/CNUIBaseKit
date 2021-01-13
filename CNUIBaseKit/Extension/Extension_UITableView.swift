//
//  Extension_UITableView.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension UITableView {
    
    // TODO: 初始化一个UITableView
    ///
    ///
    ///
    static func cn_initWith(background: UIColor = .white, style: UITableView.Style, lineStyle: UITableViewCell.SeparatorStyle, lineInset: (left: CGFloat, right: CGFloat)?, lineColor: UIColor?, showsIndicator: Bool = false) -> UITableView {
    
        let tab = UITableView(frame: CGRect.zero, style: style)
        tab.backgroundColor = background
        tab.showsVerticalScrollIndicator = showsIndicator
        
        tab.separatorStyle = lineStyle
        if tab.separatorStyle != .none {
            tab.separatorInset = UIEdgeInsets(top: 0, left: lineInset!.left, bottom: 0, right: lineInset!.right)
            tab.separatorColor = lineColor
        }
        
        tab.tableFooterView = UIView()
        
        
        return tab
        
    }
    // TODO: 移除 TableHeaderView 和 TableFooterView
    ///
    ///
    ///
    func cn_removeTableHeaderView() {
        tableHeaderView = nil
    }
    
    func cn_removeTableFooterView() {
        tableFooterView = nil
    }
    
    // TODO: 刷新
    ///
    ///
    ///
    func cn_reloadData(_ completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion()
        })
    }
}

public extension UITableView {
    
    // TODO: 注册cell 使用类名作为标识符
    ///
    ///
    ///
    func cn_registerCell(cls: AnyClass) {
        let clsName = "\(cls)"
        if Bundle.main.path(forResource: clsName, ofType: "nib") != nil {
            self.register(UINib.init(nibName: clsName, bundle: nil), forCellReuseIdentifier: clsName)
        } else {
            self.register(cls, forCellReuseIdentifier: clsName)
        }
    }
    
    // TODO: 获取重用的cell
    ///
    ///
    ///
    func cn_dequeueReusableCell<T> (cls: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: "\(cls)", for: indexPath) as? T else {
            fatalError("出错了,请检查单元格注册方法")
        }
        return cell
    }
    
    // TODO: 注册SectionHeaderFooterView 使用类名作为标识符
    ///
    ///
    ///
    func cn_registerSectionHeaderFooterView(cls: AnyClass) {
        let clsName = "\(cls)"
        if Bundle.main.path(forResource: clsName, ofType: "nib") != nil {
            self.register(UINib.init(nibName: clsName, bundle: nil), forHeaderFooterViewReuseIdentifier: clsName)
        } else {
            self.register(cls, forHeaderFooterViewReuseIdentifier: clsName)
        }
    }

    // TODO: 获取重用的HeaderFooterView
    ///
    ///
    ///
    func cn_dequeueReusableSectionHeaderFooterView<T> (cls: T.Type, for indexPath: IndexPath) -> T {
        guard let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: "\(cls)") as? T else {
            fatalError("出错了,请检查注册方法")
        }
        
        return headerFooterView
    }
}

public extension UITableView {
    
    // TODO: Scroll to top 和 Scroll to bottom
    ///
    ///
    ///
    func cn_scrollToTop(animated: Bool = true) {
        setContentOffset(CGPoint.zero, animated: animated)
    }
    
    func cn_scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
    
    // TODO: 检查IndexPath在tableView中是否有效
    ///
    ///
    ///
    func cn_isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section >= 0 &&
            indexPath.row >= 0 &&
            indexPath.section < numberOfSections &&
            indexPath.row < numberOfRows(inSection: indexPath.section)
    }
    // TODO: 安全地滚动到可能无效的IndexPath
    ///
    ///
    ///
    func cn_safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard indexPath.section < numberOfSections else { return }
        guard indexPath.row < numberOfRows(inSection: indexPath.section) else { return }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
    
}
