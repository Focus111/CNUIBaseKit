//
//  Extension_UIImageView.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

public extension UIImageView {
    
    // TODO: 初始化
    ///
    /// let imageView = UIImageView.cn_initWith(named: "xxx")
    ///
    
    static func cn_initWith(background: UIColor = UIColor.clear, named: String) -> UIImageView {
        let vie = UIImageView(image: UIImage(named: named))
        vie.backgroundColor = background
        vie.contentMode = .scaleAspectFill
        return vie
    }
    
}

public extension UIImageView {
    
    // TODO: Set image from a URL.
    ///
    ///
    ///
    func cn_download(
        from url: String,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        placeholder: UIImage? = nil,
        completionHandler: ((UIImage?) -> Void)? = nil) {

        image = placeholder
        self.contentMode = contentMode
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, _) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data,
                let image = UIImage(data: data)
                else {
                    completionHandler?(nil)
                    return
            }
            DispatchQueue.main.async { [unowned self] in
                self.image = image
                completionHandler?(image)
            }
            }.resume()
    }
    
    
}

#endif
