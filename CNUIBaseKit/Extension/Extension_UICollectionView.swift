//
//  Extension_UICollectionView.swift
//  cn
//
//  Created by Mac on 2020/12/24.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    // TODO: 初始化一个UICollectionView
    ///
    /// SwifterSwift
    ///
    static func cn_initWith(background: UIColor = .white, direction: UICollectionView.ScrollDirection = .vertical, itemSize: CGSize, lineSpacing: CGFloat, interitemSpacing: CGFloat) -> UICollectionView {
    
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.estimatedItemSize = itemSize
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = interitemSpacing
        
        let listView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        listView.backgroundColor = background
        return listView
    }
    
    
}

public extension UICollectionView {
    
    // TODO: 注册cell 使用类名作为标识符
    ///
    ///
    ///
    func cn_registerCell(cls: AnyClass) {
        let clsName = "\(cls)"
        if Bundle.main.path(forResource: clsName, ofType: "nib") != nil {
            self.register(UINib.init(nibName: clsName, bundle: nil), forCellWithReuseIdentifier: clsName)
        } else {
            self.register(cls, forCellWithReuseIdentifier: clsName)
        }
    }
    
    // TODO: 获取重用的cell
    ///
    ///
    ///
    func cn_dequeueReusableCell<T> (cls: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: "\(cls)", for: indexPath) as? T else {
            fatalError("出错了,请检查单元格注册方法")
        }
        return cell
    }

    // TODO: 注册header 使用类名作为标识符
    ///
    ///
    ///
    func cn_registerHeader(cls: AnyClass) {
        let clsName = "\(cls)"
        if Bundle.main.path(forResource: clsName, ofType: "nib") != nil {
            self.register(UINib.init(nibName: clsName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: clsName)
        } else {
            self.register(cls, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: clsName)
        }
        
    }
    
    // TODO: 获取重用的header
    ///
    ///
    ///
    func cn_dequeueReusableHeader<T> (cls: T.Type, for indexPath: IndexPath) -> T {
        guard let header = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(cls)", for: indexPath) as? T else {
            fatalError("出错了,请检查注册方法")
        }
        return header
    }
    
    // TODO: 注册footer 使用类名作为标识符
    ///
    ///
    ///
    func cn_registerFooter(cls: AnyClass) {
        let clsName = "\(cls)"
        if Bundle.main.path(forResource: clsName, ofType: "nib") != nil {
            self.register(UINib.init(nibName: clsName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: clsName)
        } else {
            self.register(cls, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: clsName)
        }
        
    }
    
    // TODO: 获取重用的footer
    ///
    ///
    ///
    func cn_dequeueReusableFooter<T> (cls: T.Type, for indexPath: IndexPath) -> T {
        guard let header = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "\(cls)", for: indexPath) as? T else {
            fatalError("出错了,请检查注册方法")
        }
        return header
    }
}
