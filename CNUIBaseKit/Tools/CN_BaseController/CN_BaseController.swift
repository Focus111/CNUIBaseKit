//
//  CN_BaseController.swift
//  aaaa
//
//  Created by Mac on 2021/1/11.
//  Copyright © 2021 szq. All rights reserved.
//

import UIKit

/// 🍵 基础控制器: CN_BaseController
///
/// 
///
///


open class CN_BaseController: UIViewController {
    
    public var cn_hideNavigationBar: Bool? = nil {
        didSet {
            self.navigationController?.navigationBar.isHidden = cn_hideNavigationBar ?? false
        }
    }
    
    public var cn_backgroundColor: UIColor? = nil {
        didSet {
            self.view.backgroundColor = cn_backgroundColor ?? UIColor.white
        }
    }
    public var cn_hidesNavigationBarHairline: Bool? = nil {
        didSet {
            
            self.navigationController?.navigationBar.shadowImage = (cn_hidesNavigationBarHairline == true ? (UIImage()):(nil))
        }
    }
    public var cn_barTintColor: UIColor? {
        didSet {
            self.navigationController?.navigationBar.barTintColor = cn_barTintColor ?? UIColor.white
        }
    }
    public var cn_barTintImage: UIImage? {
        didSet {
            self.navigationController?.navigationBar.setBackgroundImage(cn_barTintImage, for: .default)
        }
    }
    public var cn_barTitleColor: UIColor? {
        didSet {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: cn_barTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barTitleFont ?? UIFont.cn_fontSize(ofSize: 15.5, weight: .medium) as Any]
        }
    }
    public var cn_barTitleFont: UIFont? {
        didSet {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: cn_barTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barTitleFont ?? UIFont.cn_fontSize(ofSize: 15.5, weight: .medium) as Any]
        }
    }
    public var cn_barButtonItemTitleColor: UIColor? {
        didSet {
            self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: cn_barButtonItemTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barButtonItemTitleFont ?? UIFont.cn_fontSize(ofSize: 14.0, weight: .regular) as Any], for: .normal)
            self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: cn_barButtonItemTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barButtonItemTitleFont ?? UIFont.cn_fontSize(ofSize: 14.0, weight: .regular) as Any], for: .normal)
            self.navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: cn_barButtonItemTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barButtonItemTitleFont ?? UIFont.cn_fontSize(ofSize: 14.0, weight: .regular) as Any], for: .normal)
        }
    }
    public var cn_barButtonItemTitleFont : UIFont? {
        didSet {
            self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: cn_barButtonItemTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barButtonItemTitleFont ?? UIFont.cn_fontSize(ofSize: 14.0, weight: .regular) as Any], for: .normal)
            self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: cn_barButtonItemTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barButtonItemTitleFont ?? UIFont.cn_fontSize(ofSize: 14.0, weight: .regular) as Any], for: .normal)
            self.navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: cn_barButtonItemTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barButtonItemTitleFont ?? UIFont.cn_fontSize(ofSize: 14.0, weight: .regular) as Any], for: .normal)
        }
    }
    
    public var backIndicatorImage: UIImage? {
        didSet {
            self.navigationController?.navigationBar.backIndicatorImage = backIndicatorImage
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backIndicatorImage
        }
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = cn_backgroundColor ?? UIColor.white
        
        // 隐藏导航栏底部黑线（另一个办法见页面底部）
        self.navigationController?.navigationBar.shadowImage = (cn_hidesNavigationBarHairline == true ? (UIImage()):(nil))
        
        // 设置导航栏无蒙版效果（不透明）
        self.navigationController?.navigationBar.isTranslucent = false
        // 设置导航栏标题文本属性
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: cn_barTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barTitleFont ?? UIFont.cn_fontSize(ofSize: 15.5, weight: .medium) as Any]
        // 设置导航栏背景色
        self.navigationController?.navigationBar.barTintColor = cn_barTintColor ?? UIColor.white
        // 设置导航栏背景图片
        self.navigationController?.navigationBar.setBackgroundImage(cn_barTintImage, for: .default)
        // 修改导航栏返回箭头
        self.navigationController?.navigationBar.backIndicatorImage = backIndicatorImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backIndicatorImage

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 设置左右边按钮文字颜色和字体
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: cn_barButtonItemTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barButtonItemTitleFont ?? UIFont.cn_fontSize(ofSize: 14.0, weight: .regular) as Any], for: .normal)
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: cn_barButtonItemTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barButtonItemTitleFont ?? UIFont.cn_fontSize(ofSize: 14.0, weight: .regular) as Any], for: .normal)
        self.navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: cn_barButtonItemTitleColor ?? UIColor.black, NSAttributedString.Key.font: cn_barButtonItemTitleFont ?? UIFont.cn_fontSize(ofSize: 14.0, weight: .regular) as Any], for: .normal)
    }
    open override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        super.viewDidDisappear(animated)
    }
}
/*
 
 // 设置leftBarButtonItem和rightBarButtonItem文字的颜色（不包括导航栏标题）
 self.navigationController?.navigationBar.tintColor = UIColor.yellow
 
 // 在设置左右边按钮文字颜色和字体时，不要使用 self.navigationController?.navigationItem.leftBarButtonItem?.setTitleTextAttributes...
    会没有效果。
 // 在设置左右边按钮时，也不要使用
    self.navigationController?.leftBarButtonItem = ...
    会没有效果。
 */

/*
 隐藏导航栏底部黑线的另一个办法
 
 #import "TestViewController.h"
 @interface TestViewController ()
 //第一步：设置一个属性，存放导航栏底部分割线对象
 @property (nonatomic, strong) UIImageView *navBarBottomImage;
 @end

 @implementation TestViewController
 - (void)viewDidLoad {
     [super viewDidLoad];
     ////第三步：获取导航栏底部分割线对象
     UIImageView *navBarBottomImage = [self findNavBarBottomImage:self.navigationController.navigationBar];
     self.navBarBottomImage = navBarBottomImage;
  }

 //第四步：设置分割线的显示或隐藏
 //进入页面隐藏分割线
 - (void)viewWillAppear:(BOOL)animated{
     [super viewWillAppear:animated];
         self.navBarBottomImage.hidden = YES;
 }
 //离开页面时显示分割线
 -(void)viewWillDisappear:(BOOL)animated{
     [super viewWillDisappear:animated];
     self.navBarBottomImage.hidden = NO;
 }

 //第二步：添加用于获取导航栏分割线的方法
 //导航栏底部分割线是一个UIImageView,且高度不超过1.0个高度，可据此查找此对象
 -(UIImageView *)findNavBarBottomImage:(UIView *)view {
     if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
         return (UIImageView *)view;
     }
     for (UIView *subview in view.subviews) {
         UIImageView *imageView = [self findNavBarBottomImage:subview];
         if (imageView) {
             return imageView;
         }
     }
     return nil;
 }
 */
