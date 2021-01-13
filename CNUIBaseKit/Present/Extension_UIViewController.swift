//
//  Extension_UIViewController.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit


public extension UIViewController {
    
    // TODO: SwiftPopup sheet方式跳转
    ///
    /// self.cn_presentWithSheet(con, completion: nil)
    ///
    func cn_presentWithSheet(_ alertCon: SwiftPopup, completion: (() -> Void)? = nil) {
        
        alertCon.backViewColor = UIColor.black.withAlphaComponent(0.2)
        alertCon.showAnimation = SwiftPopupShowSheetAnimation()
        alertCon.dismissAnimation = SwiftPopupDismissSheetAnimation()
        self.present(alertCon, animated: true, completion: completion)
    }
    
    // TODO: SwiftPopup alert方式跳转
    ///
    /// self.cn_presentWithAlert(con, completion: nil)
    ///
    func cn_presentWithAlert(_ alertCon: SwiftPopup, completion: (() -> Void)? = nil) {
        
        alertCon.backViewColor = UIColor.black.withAlphaComponent(0.2)
        alertCon.showAnimation = SwiftPopupShowAlertAnimation()
        alertCon.dismissAnimation = SwiftPopupDismissAlertAnimation()
        self.present(alertCon, animated: true, completion: completion)
    }
    
}

public extension UIViewController {

    // TODO: push 方式跳转
    ///
    /// self.cn_pushController(con)
    ///
    
    func cn_pushController(controller: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(controller, animated: animated)
    }
}
    
    
    
