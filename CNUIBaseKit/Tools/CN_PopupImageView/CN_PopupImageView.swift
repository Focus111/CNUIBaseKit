//
//  CN_PopupImageView.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: 一张图片占据整个屏幕, 点击图片返回
///
/// 可以设置: 网络图片、图片的size、默认图片
/// eg:
///    let ruleView = CN_PopupImageView()
///    ruleView.url = "......"
///    ruleView.placeHolder = UIImage(named: "MyCenter_VipRemind")
///    ruleView.cgSize = CGSize(width: cn_scale(205.0), height: cn_scale(236.0))
///    ruleView.show_Event()
///

public class CN_PopupImageView: UIView {
    
    // 网络图片
    public var url = "" {
        didSet {
            imgV.kf.indicatorType = .activity
            imgV.kf.setImage(with: URL(string: url), options: [.transition(.none)])
        }
    }
    // 图片的size
    public var cgSize: CGSize = .zero {
        didSet {
            // 在外部使用 cn_scale(cgSize.width)
            imgV.snp.remakeConstraints { (m) in
                m.center.equalToSuperview()
                m.width.equalTo(cgSize.width)
                m.height.equalTo(cgSize.height)
            }
        }
    }
    // 默认图片
    public var placeHolder: UIImage? = nil {
        didSet {
            imgV.image = placeHolder
        }
    }
    
    // MARK: Properties
    private let imgV = UIImageView()
        
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: cn_Width_Screen, height: cn_Height_Screen)
        // AddView
        imgV.contentMode = .scaleAspectFill
        self.addSubview(imgV)
        // Layout
        self.setUI()
        // AddEvent
        self.imgV.cn_addTapGesture { (ges) in
            self.dismiss_Event()
        }
        
    }
    // MARK: Layout
    private func setUI() {
        imgV.snp.makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 显示弹框
    @objc public func show_Event() {
        guard let window = UIApplication.shared.delegate?.window else {
            return
        }
        window?.addSubview(self)
        self.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1
            self.backgroundColor = UIColor.black.withAlphaComponent(0.2)
            self.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        }) { (finished) in
            if finished {
            }
        }
    }
 
    // 消除弹框
    @objc private func dismiss_Event() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.alpha = 0
        }) { (finished) in
            if finished {
                self.removeFromSuperview()
            }
        }
    }
    
}
