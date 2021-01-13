//
//  SwiftPopupSheetAnimation.swift
//  duluxshop
//
//  Created by Mac on 2020/3/4.
//  Copyright © 2020 szqingwa. All rights reserved.
//

import UIKit

open class SwiftPopupShowSheetAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    public var duration: TimeInterval = 0.5
    public var delay: TimeInterval = 0.0
    public var springWithDamping: CGFloat = 1.0  // 小于1时，有弹簧效果
    public var springVelocity: CGFloat = 2.5
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController( forKey: UITransitionContextViewControllerKey.to),
            let toView = transitionContext.view( forKey: UITransitionContextViewKey.to)
            else {
            return
        }
        
        let containerView = transitionContext.containerView
        toView.frame = transitionContext.finalFrame(for: toViewController)
        containerView.addSubview(toView)
        
        toView.transform = CGAffineTransform(translationX: 0, y: cn_Height_Screen)
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: springWithDamping,
                       initialSpringVelocity: springVelocity,
                       options: .curveEaseInOut, animations: {
                        toView.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }
    }
}

open class SwiftPopupDismissSheetAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    public var duration: TimeInterval = 0.3
    public var delay: TimeInterval = 0.0
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view( forKey: UITransitionContextViewKey.from)
            else {
                return
        }
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: .curveEaseInOut,
                       animations: {
                        fromView.transform = CGAffineTransform(translationX: 0, y: cn_Height_Screen)
                        fromView.alpha = 0.0
        }) { (finished) in
//            fromView.alpha = 1.0
            transitionContext.completeTransition(finished)
        }
    }
}
