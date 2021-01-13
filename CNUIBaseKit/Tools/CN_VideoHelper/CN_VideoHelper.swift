//
//  CN_VideoHelper.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit
import AVFoundation

// TODO: 抓取视频中的截图，可以作为封面
///
/// eg:
///     CN_VideoHelper.thumbImageFrom(url: URL(string: singleMaterialModel.upload_file[0])!) { (image) in
///         imageView.image = image
///     }
///

public class CN_VideoHelper {

    private init() {}
    
    // TODO: 抓取视频中的截图
    public class func thumbImageFrom(url: URL, image: @escaping (UIImage?) -> ()) {
        DispatchQueue.global(qos: .default).async {
            let asset = AVURLAsset.init(url: url, options: nil)
            let assetImageGenerator = AVAssetImageGenerator.init(asset: asset)
            assetImageGenerator.appliesPreferredTrackTransform = true
            assetImageGenerator.apertureMode = .encodedPixels
            guard let thumbnailImageRef = try? assetImageGenerator.copyCGImage(at: CMTime.init(value: 2, timescale: 1), actualTime: nil) else {
                DispatchQueue.main.async {
                    image(nil)
                }
                return
            }
            let thumbnailImage = UIImage.init(cgImage: thumbnailImageRef)
            DispatchQueue.main.async {
                image(thumbnailImage)
            }
        }
    }

}
