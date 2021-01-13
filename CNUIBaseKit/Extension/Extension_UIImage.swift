//
//  Extension_UIImage.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension UIImage {
    
    // TODO: 根据多个颜色生成一个渐变色的image
    ///
    ///
    ///
    
    static func cn_generateGradientImageFrom(colors : [UIColor]) -> UIImage? {
        
        
        let cgcolors = colors.map { $0.cgColor }
        let size = CGRect(x: 0, y: 0, width: 1, height: 1).size
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        defer { UIGraphicsEndImageContext() }
        
        var locations : [CGFloat] = [0.0, 0.5, 1.0]
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: cgcolors as NSArray as CFArray, locations: &locations) else { return nil }
        
        context.drawLinearGradient(gradient, start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: size.width, y: 0.0), options: [])
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    // TODO: 根据颜色色值生成一个image
    ///
    ///
    ///
    
    static func cn_generateImageFrom(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect)
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    // TODO: 改变图片的颜色，生成一个新的image
    ///
    ///
    ///
    
    func cn_changeImageColorForImage(_ newColor: UIColor, blendMode: CGBlendMode = CGBlendMode.destinationIn, alpha: CGFloat = 1.0) -> UIImage {
        let drawRect = CGRect(origin: .zero, size: size)

        #if !os(watchOS)
        if #available(tvOS 10.0, *) {
            let format = UIGraphicsImageRendererFormat()
            format.scale = scale
            return UIGraphicsImageRenderer(size: size, format: format).image { context in
                newColor.setFill()
                context.fill(drawRect)
                draw(in: drawRect, blendMode: blendMode, alpha: alpha)
            }
        }
        #endif

        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        newColor.setFill()
        context?.fill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: alpha)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    // TODO: 修改图片的size，生成一个新的image
    ///
    ///
    ///
    
    func cn_changeImageSizeForImage(size: CGSize) -> UIImage {
        let newSize = CGSize(width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    // TODO: 压缩图片，生成Data
    ///
    ///
    ///
    func cn_compressImageForData(maxLengh: CGFloat, maxKB : CGFloat) -> Data {
        
        var limit_MaxKB    = maxKB
        var limit_maxLengh = maxLengh
        
        if (limit_MaxKB <= 0.0) {
            
            limit_MaxKB = 1024.0;
            
        }
        
        if (limit_maxLengh <= 0.0)  {
            
            limit_maxLengh = 1024.0;
            
        }
        
        // 先调整分辨率
        var imageSize = CGSize.init(width: self.size.width, height: self.size.height)
        
        let tempHeight = imageSize.height / limit_maxLengh;
        let tempWidth  = imageSize.width  / limit_maxLengh;
        
        if (tempWidth > 1.0 && tempWidth > tempHeight) {
            
            imageSize = CGSize.init(width: self.size.width / tempWidth, height: self.size.height / tempWidth)
            
        }
            
        else if (tempHeight > 1.0 && tempWidth < tempHeight){
            
            imageSize = CGSize.init(width: self.size.width / tempHeight, height: self.size.height / tempHeight)
            
        }
        
        UIGraphicsBeginImageContext(imageSize)
        
        self.draw(in: CGRect.init(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        var imageData = newImage!.jpegData(compressionQuality: 1.0)
        
        var sizeOriginKB : CGFloat = CGFloat((imageData?.count)!) / 1024.0;
        
        // 调整大小
        
        var resizeRate = 0.9;
        
        while (sizeOriginKB > limit_MaxKB && resizeRate > 0.1) {
            imageData = newImage!.jpegData(compressionQuality: CGFloat(resizeRate))
            
            sizeOriginKB = CGFloat((imageData?.count)!) / 1024.0;
            
            resizeRate -= 0.1;
            
        }
        
        return imageData!
        
    }
}
