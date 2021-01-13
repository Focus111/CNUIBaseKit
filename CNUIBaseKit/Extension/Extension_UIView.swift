//
//  Extension_UIView.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension UIView {
    
    // TODO: 初始化一个View
    ///
    ///
    ///
    static func cn_initViewWith(background: UIColor = .white, radii: CGFloat = 0.0) -> UIView {
        let vie = UIView()
        vie.backgroundColor = background
        if radii != 0.0 {
            vie.layer.cornerRadius = radii
            vie.clipsToBounds = true
        }
        return vie
    }
    
    // TODO: 得到或设置View的宽、高、x、y、size
    ///
    ///
    ///
    var cn_width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    var cn_height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    var cn_x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    var cn_y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    var cn_size: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }
}

public extension UIView {
    
    // TODO: 移除所有子视图
    ///
    ///
    ///
    func cn_removeSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
    
    // TODO: 添加点击手势
    ///
    ///
    ///
    func cn_addTapGesture(target: Any, action: Selector) {
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target : target, action : action)
        self.addGestureRecognizer(tapGesture)
    }
    // TODO: 添加点击手势
    ///
    ///
    ///
    func cn_addTapGesture(_ block: ((UIGestureRecognizer)->Void)?) {
        
        cn_setAssociatedObject(key: "k_UIViewClickActionKey", value: block)
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(k_tapAction))
        self.addGestureRecognizer(tap)
    }
    @objc private func k_tapAction(tap: UIGestureRecognizer) {
        DispatchQueue.main.async {
            (self.cn_getAssociatedObject(key: "k_UIViewClickActionKey") as? ((UIGestureRecognizer)->Void))?(tap)
        }
    }
    // TODO: 添加长按手势
    ///
    ///
    ///
    func cn_addLongGesture(_ block: ((UIGestureRecognizer)->Void)?) {
        
        cn_setAssociatedObject(key: "k_UIViewClickActionKey", value: block)
        self.isUserInteractionEnabled = true
        let tap = UILongPressGestureRecognizer.init(target: self, action: #selector(k_tapAction))
        tap.minimumPressDuration = 0.5
        self.addGestureRecognizer(tap)
    }
    // TODO: 添加轻扫手势
    ///
    ///
    ///
    func cn_addSwipeGesture(direction: UISwipeGestureRecognizer.Direction, _ block: ((UIGestureRecognizer)->Void)?) {
        
        cn_setAssociatedObject(key: "k_UIViewClickActionKey", value: block)
        self.isUserInteractionEnabled = true
        let tap = UISwipeGestureRecognizer.init(target: self, action: #selector(k_tapAction))
        tap.direction = direction
        self.addGestureRecognizer(tap)
    }
    
    // TODO: 移除所有手势
    ///
    ///
    ///
    func cn_removeGestures() {
        gestureRecognizers?.forEach(removeGestureRecognizer)
    }
    
    // TODO: 取消键盘
    ///
    ///
    ///
    func cn_dismissKeyboard() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDismissAction))
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main) { [weak self] (note) in
            
            self?.addGestureRecognizer(tap)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: OperationQueue.main) { [weak self] (note) in
            
            self?.removeGestureRecognizer(tap)
        }
    }
    @objc private func tapDismissAction() {
        
        self.endEditing(true)
    }
    
    // TODO: 截取UIView对象返回一张图片
    ///
    ///
    ///
    func cn_snapshotImage() -> UIImage? {
        self.layoutIfNeeded()
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)  // UIScreen.main.scale
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        self.layer.render(in: context)
        let tempImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tempImage
    }
    
    // TODO: 绘制虚线
    ///
    ///- Parameters:
    ///   - length: 线长
    ///   - spacing: 间隔
    ///   - color: 颜色
    func cn_drawDashLine(length: Int, spacing: Int, color: UIColor) {
        self.layoutIfNeeded()
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = self.bounds
        // 只要是CALayer这种类型,他的anchorPoint默认都是(0.5,0.5)
//        shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
        //shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = color.cgColor
        
        shapeLayer.lineWidth = self.bounds.height
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        
        shapeLayer.lineDashPattern = [NSNumber(value: length), NSNumber(value: spacing)]
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
}


public extension UIView {
    
    // TODO: 设置渐变色
    ///
    ///
    ///
    enum GradientColorPoint {
        case left
        case leftTop
        case leftBottom
        case right
        case rightTop
        case rightBottom
        case top
        case bottom
    }
    
    func cn_setGradientColor(colors: [CGColor], startPoint: GradientColorPoint, endPoint: GradientColorPoint) {
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        switch startPoint {
        case .left:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        case .leftTop:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        case .leftBottom:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        case .right:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightTop:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        case .rightBottom:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        case .top:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        case .bottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        }

        switch endPoint {
        case .left:
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .leftTop:
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        case .leftBottom:
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        case .right:
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightTop:
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .rightBottom:
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        case .top:
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        case .bottom:
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        }
        // Convert our CALayer to a UIImage object
        UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, false, 0.0)  // UIScreen.main.scale
        guard let context = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return
        }
        gradientLayer.render(in: context)
        let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let color = UIColor(patternImage: backgroundColorImage!)
        self.layer.backgroundColor = color.cgColor

    }
    
    // TODO: 给视图添加模糊的效果
    ///
    /// - Parameter style: UIBlurEffectStyle (default is .light).
    ///
    func cn_blurry(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
    }
    
    // TODO: 设置阴影
    ///
    ///
    ///
    func cn_setShadow(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        //设置阴影颜色
        self.layer.shadowColor   = color.cgColor
        //设置阴影偏移量
        self.layer.shadowOffset  = offset
        //设置透明度
        self.layer.shadowOpacity = opacity
        //设置阴影半径
        self.layer.shadowRadius  = radius
    }
    
    // TODO: 设置所有角
    ///
    ///
    ///
    func cn_setAllCorners(radii: CGFloat = 0.0) {
        if radii == 0.0 {
            self.layoutIfNeeded()
            layer.cornerRadius = (self.bounds.height / 2.0)
        } else {
            layer.cornerRadius = radii
        }
        clipsToBounds = true
    }
    
    // TODO: 设置部分角
    ///
    /// CACornerMask: layerMaxXMaxYCorner - 右下角; layerMaxXMinYCorner - 右上角;
    ///               layerMinXMaxYCorner - 左下角; layerMinXMinYCorner - 左上角;
    /// UIRectCorner: bottomRight         - 右下角; topRight            - 右上角;
    ///               bottomLeft          - 左下角; topLeft             - 左上角;
    func cn_setSomeCorners(corners_after: CACornerMask, corners_before: UIRectCorner, radii: CGFloat) {
        if #available(iOS 11.0, *) {
            layer.cornerRadius = radii
            layer.maskedCorners = corners_after
            clipsToBounds = true
        } else {
            self.layoutIfNeeded()
            let maskPath = UIBezierPath(
                roundedRect: bounds,
                byRoundingCorners: corners_before,
                cornerRadii: CGSize(width: radii, height: radii))

            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            layer.mask = shape
        }
    }
    
    // TODO: 设置边框
    ///
    ///
    ///
    func cn_setBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
}

// TODO: 动画
///
///
///
public extension UIView {
    
    // TODO: 闪动动画
    ///
    /// 文字放大和缩小
    ///
    func cn_peekAnimation() {
        
        self.layer.removeAllAnimations()
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.duration = 0.5
        animation.calculationMode = CAAnimationCalculationMode.linear
        animation.values = [1.5, 0.8, 1.0, 1.2, 1.0]
        layer.add(animation, forKey: "transform.scale")
    }
    
    // TODO: 抖动动画
    ///
    /// 比如：当输入数量小于1时
    ///
    func cn_shakeAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        //获取当前View的position坐标
        let positionX = layer.position.x
        //设置抖动的范围
        animation.values = [(positionX-10),(positionX),(positionX+10)]
        //动画重复的次数
        animation.repeatCount = 3
        //动画时间
        animation.duration = 0.07
        //设置自动反转
        animation.autoreverses = true
        //将动画添加到layer
        layer.add(animation, forKey: nil)
    }
    
    // TODO: 弹簧动画
    ///
    /// - Parameters:
    ///   - withDuration: 时长
    ///   - usingSpringWithDamping: 0~1.0 越大月不明显
    ///   - animations: 动画
    ///   - completion: 回调
    
    func cn_springAnimation(withDuration: TimeInterval, usingSpringWithDamping: CGFloat, animations: (()->Void)?, completion: ((Bool)->Void)? = nil) {
        
        guard let animations = animations else { return }
        UIView.animate(withDuration: withDuration, delay: 0.0, usingSpringWithDamping: usingSpringWithDamping, initialSpringVelocity: 0.0, options: .allowAnimatedContent, animations: animations, completion: completion)
    }
}
