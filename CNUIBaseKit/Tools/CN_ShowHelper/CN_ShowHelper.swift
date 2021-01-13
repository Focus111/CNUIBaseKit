//
//  CN_ShowHelper.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: 放大展示图片
///
/// eg:
///     CN_ShowHelper.show(imageView: self.doorImg)
///

public class CN_ShowHelper: NSObject {
    
    /// 放大图片的时间
    private static let showBigDuration = 0.5
    /// 缩放图片的时间
    private static let showOriginalDuration = 0.5
    /// 图片imageView的原始frame
    private static var originalFrame = CGRect()
    
    private override init() {
        super.init()
    }
    
    
}
public extension CN_ShowHelper {
    
    // MARK: USE
    static func show(imageView: UIImageView) {
        self.showBigImage(sender: imageView)
    }
    
    private static func showBigImage(sender: UIImageView) {
        guard let image = sender.image else {
            return
        }
        guard let window = UIApplication.shared.delegate?.window else {
            return
        }
        // originalFrame重新归零
        originalFrame = CGRect()
        let oldFrame = sender.convert(sender.bounds, to: window)
        let backgroundView = UIView(frame: UIScreen.main.bounds)
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.0
        //赋值originalFrame
        originalFrame = oldFrame
        let newImageV = UIImageView(frame: oldFrame)
        newImageV.contentMode = .scaleAspectFit
        newImageV.image = image
        backgroundView.addSubview(newImageV)
        window?.addSubview(backgroundView)
        
        UIView.animate(withDuration: self.showBigDuration) {
            let width = UIScreen.main.bounds.size.width
            let height = image.size.height * width / image.size.width
            let y = (UIScreen.main.bounds.size.height - image.size.height * width / image.size.width) * 0.5
            newImageV.frame = CGRect(x: 0, y: y, width: width, height: height)
            backgroundView.alpha = 1
        }
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.showOriginal(sender:)))
        backgroundView.addGestureRecognizer(tap2)
    }
    
    @objc private static func showOriginal(sender: UITapGestureRecognizer) {
        guard let backgroundView = sender.view else {
            return
        }
        guard let imageV = backgroundView.subviews.first else {
            return
        }
        //大图的frame变为原来的frame，backgroundView的透明度为0，同时backgroundView从父视图移除
        UIView.animate(withDuration: showOriginalDuration, animations: {
            imageV.frame = originalFrame
            backgroundView.alpha = 0.0
        }) { finished in
            backgroundView.removeFromSuperview()
        }
    }
}
