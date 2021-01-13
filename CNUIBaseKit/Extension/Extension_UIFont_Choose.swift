//
//  Extension_UIFont_Choose.swift
//  cn
//
//  Created by Mac on 2020/12/22.
//  Copyright © 2020 szq. All rights reserved.
//

import UIKit

// TODO: 适配不同字体
///
/// UIFont.cn_fontSize(ofName: .PingFangSC, type: .None, size: 15)
///

public enum FontType: String {
    
    case None               = ""
    case Light              = "Light"
    case Bold               = "Bold"
    case Thin               = "Thin"
    case Regular            = "Regular"
    case SemiBold           = "SemiBold"
    case UltraLight         = "UltraLight"
    case Medium             = "Medium"
    case Italic             = "Italic"
    case UltraBold          = "UltraBold"
    case SemiBoldItalic     = "SemiBoldItalic"
    case BoldItalic         = "BoldItalic"
    case LightItalic        = "LightItalic"
    case Wide               = "Wide"
    case W4                 = "W4"
    case ItalicMT           = "ItalicMT"
    case BoldItalicMT       = "BoldItalicMT"
    case BoldMT             = "BoldMT"
    case Heavy              = "Heavy"
    case MediumItalic       = "MediumItalic"
    case UltraLightItalic   = "UltraLightItalic"
    case HeavyItalic        = "HeavyItalic"
    case DemiBoldItalic     = "DemiBoldItalic"
    case DemiBold           = "DemiBold"
    case ThinItalic         = "ThinItalic"
    case CondensedBlack     = "CondensedBlack"
    case CondensedBold      = "CondensedBold"
    case Oblique            = "Oblique"
    case HeavyOblique       = "HeavyOblique"
    case BlackOblique       = "BlackOblique"
    case BookOblique        = "BookOblique"
    case Roman              = "Roman"
    case Black              = "Black"
    case MediumOblique      = "MediumOblique"
    case Book               = "Book"
    case LightOblique       = "LightOblique"
    case CondensedExtraBold = "CondensedExtraBold"
    case CondensedMedium    = "CondensedMedium"
    case BlackItalic        = "BlackItalic"
    case ExtraBlack         = "ExtraBlack"
    case W3                 = "W3"
    case W6                 = "W6"
    case BoldOblique        = "BoldOblique"
    case BookIta            = "BookIta"
    case Condensed          = "Condensed"
    case CondensedLight     = "CondensedLight"
    case BookIt             = "BookIt"
    
}

public enum FontName: String {
    
    case Copperplate
    case AppleSDGothicNeo
    case Thonburi
    case GillSans
    case MarkerFelt
    case HiraMaruProN
    case CourierNewPS
    case CourierNewPSMT
    case KohinoorTelugu
    case AvenirNextCondensed
    case TamilSangamMN
    case HelveticaNeue
    case GurmukhiMN
    case Georgia
    case TimesNewRomanPS
    case TimesNewRomanPSMT
    case SinhalaSangamMN
    case ArialRoundedMTBold
    case Kailasa
    case KohinoorDevanagari
    case KohinoorBangla
    case ChalkboardSE
    case AppleColorEmoji
    case PingFangTC
    case GujaratiSangamMN
    case GeezaPro
    case DamascusBold
    case DamascusLight
    case Damascus
    case DamascusMedium
    case DamascusSemiBold
    case Noteworthy
    case Avenir
    case DiwanMishafi
    case AcademyEngravedLetPlain
    case Futura
    case PartyLetPlain
    case KannadaSangamMN
    case ArialHebrew
    case Farah
    case Arial
    case ArialMT
    case Chalkduster
    case Kefa
    case HoeflerText
    case Optima
    case Palatino
    case MalayalamSangamMN
    case AlNile
    case LaoSangamMN
    case BradleyHandITCTT
    case HiraMinProN
    case PingFangHK
    case Helvetica
    case Courier
    case Cochin
    case TrebuchetMS
    case Trebuchet
    case DevanagariSangamMN
    case OriyaSangamMN
    case Rockwell
    case SnellRoundhand
    case ZapfDingbatsITC
    case BodoniSvtyTwoITCTT
    case Verdana
    case AmericanTypewriter
    case AvenirNext
    case Baskerville
    case KhmerSangamMN
    case Didot
    case SavoyeLetPlain
    case BodoniOrnamentsITCTT
    case Symbol
    case Charter
    case Menlo
    case NotoNastaliqUrdu
    case BodoniSvtyTwoSCITCTT
    case DINAlternate
    case Papyrus
    case HiraginoSans
    case PingFangSC
    case MyanmarSangamMN
    case NotoSansChakma
    case Zapfino
    case BodoniSvtyTwoOSITCTT
    case EuphemiaUCAS
    case DINCondensed
    case Geneva
    case SanFranciscoDisplay
    case Seravek
    
    // 自定义字体
    case FZLanTingHeiS_DB1_GB // 方正兰亭中粗黑简体
    case FZLTHJW_GB1_0        // 兰亭黑简
    case DINCond_Bold
    case DFPYuanW9            // 华康圆体W9(P)
}

public extension UIFont {

    static func cn_fontSize(ofName: FontName, type: FontType, size: CGFloat) -> UIFont! {
        
      let fontName = ofName.rawValue + "-" + type.rawValue
      if let font = UIFont(name: fontName, size: cn_scale(size)) {
          return font
      }

      // not type
      let fontName_notType = ofName.rawValue
      if let font = UIFont(name: fontName_notType, size: cn_scale(size)) {
          return font
      }

      // not font
      let fontName_notFont = ofName.rawValue + "-" + "Regular"
      if let font = UIFont(name: fontName_notFont, size: cn_scale(size)) {
          return font
      }

      return nil
    }

    static func PrintFontFamily(fontName: FontName) {
        let arr = UIFont.fontNames(forFamilyName: fontName.rawValue)
        for name in arr {
            print(name)
        }
    }
}

