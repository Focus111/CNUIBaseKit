//
//  SwiftPopupShowAlertAnimation.swift
//  duluxshop
//
//  Created by Mac on 2020/3/8.
//  Copyright © 2020 szqingwa. All rights reserved.
//

import UIKit

class SwiftPopupShowAlertAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    public var duration: TimeInterval = 0.8
    public var delay: TimeInterval = 0.0
    public var springWithDamping: CGFloat = 0.8
    public var springVelocity: CGFloat = 2.0
    
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
        
        toView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: springWithDamping,
                       initialSpringVelocity: springVelocity,
                       options: .curveEaseInOut, animations: {
                        toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }
    }
}

open class SwiftPopupDismissAlertAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
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
                        fromView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
                        fromView.alpha = 0.0
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }
    }
}

