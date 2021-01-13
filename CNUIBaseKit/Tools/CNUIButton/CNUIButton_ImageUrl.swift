//
//  CNUIButton_ImageUrl.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: 初始化多种样式的 UIButton(自定义了View)
///
///
///
public extension CNUIButton_ImageUrl {
 
    // 设置网络图片
    func setImageUrl_CN(imageUrl: String, placeImage: UIImage? = nil, state: UIControl.State = .normal) {
        
        let url = URL(string: imageUrl)
        self.image_View.kf.setImage(with: url, placeholder: placeImage, options: [.transition(.none)])

    }
    
}

public class CNUIButton_ImageUrl: UIView {
    
    public enum CNUIButton_ImageUrlType {
        
        case leftImgRightTitle
        
        case leftTitleRightImg
        
        case topTitleBottomImg
        
        case topImgBottomTitle
        
    }
    
    public var btnType: CNUIButton_ImageUrlType? {
        didSet {
            // Layout
            self.setUI()
        }
    }
    public var spacing: CGFloat = 5.0
    
    // MARK: Properties
    public let image_View = UIImageView()
    public let text_Label  = UILabel()
    
    
    private var image_width: CGFloat  = 0.0
    private var image_height: CGFloat = 0.0
    
    // MARK: LifeCycle
    public init(frame: CGRect = .zero, image_width: CGFloat, image_height: CGFloat) {
        super.init(frame: frame)

        self.image_width  = image_width
        self.image_height = image_height
        // AddView
        self.addSubview(image_View)
        self.addSubview(text_Label)
        //
        btnType = CNUIButton_ImageUrlType.leftImgRightTitle

    }
    
    // MARK: Layout
    private func setUI() {
        
        switch btnType {
        case .topImgBottomTitle:
            // 上边图片下边文字
            image_View.snp.makeConstraints { (m) in
                m.top.equalToSuperview()
                m.centerX.equalToSuperview()
                m.width.equalTo(self.image_width)
                m.height.equalTo(self.image_height)
            }
            text_Label.snp.makeConstraints { (m) in
                m.top.equalTo(image_View.snp.bottom).offset(spacing)
                m.left.right.bottom.equalToSuperview()
            }
        case .topTitleBottomImg:
            // 上边文字下边图片
            text_Label.snp.makeConstraints { (m) in
                m.left.top.right.equalToSuperview()
            }
            image_View.snp.makeConstraints { (m) in
                m.top.equalTo(text_Label.snp.bottom).offset(spacing)
                m.centerX.equalToSuperview()
                m.width.equalTo(self.image_width)
                m.height.equalTo(self.image_height)
            }
        case .leftTitleRightImg:
            // 左边文字右边图片
            text_Label.snp.makeConstraints { (m) in
                m.left.centerY.equalToSuperview()
            }
            image_View.snp.makeConstraints { (m) in
                m.left.equalTo(text_Label.snp.right).offset(spacing)
                m.centerY.equalToSuperview()
                m.width.equalTo(self.image_width)
                m.height.equalTo(self.image_height)
            }
        default:
            // 默认（左边图片右边文字）
            image_View.snp.makeConstraints { (m) in
                m.left.equalToSuperview()
                m.centerY.equalToSuperview()
                m.width.equalTo(self.image_width)
                m.height.equalTo(self.image_height)
            }
            text_Label.snp.makeConstraints { (m) in
                m.left.equalTo(image_View.snp.right).offset(spacing)
                m.centerY.right.equalToSuperview()
            }
        }
        self.layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
