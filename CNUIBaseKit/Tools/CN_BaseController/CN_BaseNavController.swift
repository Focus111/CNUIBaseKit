//
//  CN_BaseNavController.swift
//  aaaa
//
//  Created by Mac on 2021/1/11.
//  Copyright © 2021 szq. All rights reserved.
//

import UIKit

/// 🍵 基础导航栏:
///
///    CN_BaseNavController
///

/// 🍵 导航栏返回事件:
///
/// eg:
///     (self.navigationController as? CN_BaseNavController)!.cn_backBlock = {
///         self.navigationController?.popToRootViewController(animated: true)
///     }
///
/// (self.navigationController as? CN_BaseNavController)!.cn_backBlock = {}


open class CN_BaseNavController: UINavigationController, UINavigationControllerDelegate {
    
    public var cn_backBlock: (()->())?
    
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = false
        
        let pan = UIPanGestureRecognizer(target: self.interactivePopGestureRecognizer?.delegate, action: Selector(("handleNavigationTransition:")))
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    open override func popViewController(animated: Bool) -> UIViewController? {
        if self.cn_backBlock != nil {
            self.cn_backBlock!()
        }
        return super.popViewController(animated: animated)
    }
    
    /// - UINavigationControllerDelegate
    open func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    }
    
    open func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        ///  self.navigationBar.isHidden = true
    }
    
}

extension CN_BaseNavController: UIGestureRecognizerDelegate {
    
    open func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return self.children.count > 1
    }
}
/*
 想保留导航栏的位置但不想有导航栏时的方法
 open func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
     // 方法一
     self.transitionCoordinator?.animateAlongsideTransition(in: self.view, animation: { (context) in
            self.navigationBar.alpha = 0.0
     }, completion: { (context) in
            debugPrint("complete")
     })
     // 方法二
     self.navigationBar.alpha = 0.0
 }
 */
