//
//  CNUILoadingLabel.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: 点击label加载转圈动画
///
///
///

public class CNUILoadingLabel: UILabel {

    // 点击手势，外部无需再添加手势
    public var clickBlock: (()->())?
    // 控制停止，stop == true就会停止
    public var stop: Bool? {
        didSet {
            stop == true ? (self.stopLoading_Event()):()
            stop = false
        }
    }
    
    // MARK: Parameter
    private var oldCornerRadius: CGFloat = 1.0
    private var oldFrame: CGRect = CGRect.zero
    private var oldTitle: String = ""
    private var strokeColor: CGColor?
    
    // MARK: Properties
    private var leftShape = CAShapeLayer()

    // MARK: LifeCycle
    public init(background: UIColor = .white, text: String, textColor: UIColor, font: UIFont, alignment: NSTextAlignment = .left, numberOfLines: Int = 1, lineSpacing: CGFloat? = nil, strokeColor: UIColor? = UIColor.white) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = background
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.lineBreakMode = .byCharWrapping
        self.strokeColor   = strokeColor?.cgColor
        
        if lineSpacing != nil {
            self.setValue(lineSpacing, forKey: "lineSpacing")
        }
        // AddEvent
        self.cn_addTapGesture(target: self, action: #selector(self.startLoading_Event))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Event
    @objc private func startLoading_Event() {
        self.oldTitle = self.text ?? ""
        self.oldFrame = self.frame
        self.oldCornerRadius = self.layer.cornerRadius
        
        leftShape = CAShapeLayer()
        let radius: CGFloat = oldFrame.size.height / 2.0
        let leftPath = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius), radius: radius - 5, startAngle: CGFloat(Double.pi/2 + Double.pi/4), endAngle: -.pi, clockwise: true)
        leftPath.lineWidth = 3
        leftShape.path = leftPath.cgPath
        leftShape.backgroundColor = UIColor.clear.cgColor
        leftShape.fillColor = UIColor.clear.cgColor
        leftShape.lineCap = .round
        leftShape.lineJoin = .round
        leftShape.strokeColor = self.strokeColor ?? UIColor.white.cgColor
        leftShape.lineWidth = leftPath.lineWidth

        
        
        self.isUserInteractionEnabled = false
        self.text = ""
        // 开始动画
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .layoutSubviews, animations: {
            // 1.将矩形按钮缩成圆型
            // 改变圆角
            self.layer.cornerRadius = self.frame.size.height / 2.0
            self.layer.masksToBounds = true
            // 改变frame
            self.snp.remakeConstraints { (m) in
                m.center.equalTo(self.center)
                m.width.height.equalTo(cn_scale(38))
            }
        }) { finished in

            // 添加小弧线
            self.layer.addSublayer(self.leftShape)
            // 显示小弧线
            self.leftShape.isHidden = false

            // 2.旋转圆形按钮
            let animation = CABasicAnimation(keyPath: "transform.rotation.z")
            animation.toValue = NSNumber(value: Double.pi * 7000)
            animation.duration = 1000
            animation.beginTime = 0
            animation.fillMode = .both
            self.layer.add(animation, forKey: nil)

            if self.clickBlock != nil {
                self.clickBlock!()
            }
            
        }
    }
    private func stopLoading_Event() {
        // 移除动画
        self.layer.removeAllAnimations()
        // 隐藏弧线
        self.leftShape.isHidden = true
        
        // 还原动画
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .layoutSubviews, animations: {

            // 3.将圆形按钮展开成矩形
            // 恢复最初圆角
            self.layer.cornerRadius = self.oldCornerRadius
            self.layer.masksToBounds = true
            // 恢复最初frame
            self.snp.remakeConstraints { (m) in
                m.center.equalTo(self.center)
                m.height.equalTo(cn_scale(38))
                m.left.right.equalToSuperview().inset(20)
            }
            // 显示title
            self.text = self.oldTitle
        }) { finished in

            // 开启用户交互
            self.isUserInteractionEnabled = true
        }
    }
}
