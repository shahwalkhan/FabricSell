//
//  UtilitiesExtensions.swift
//  FabricSell
//
//  Created by KiwiTech on 10/09/18.
//

import UIKit

enum EngagingChoiceName:String {
    case poweredBy = "Powered by"
}
enum EngagingChoiceGridCell:CGFloat {
    case cellHeight = 200
}
enum EngagingChoiceAPI:String {
    case offerListURL = "https://funn-qa.kiwireader.com/publisherapi/offer-list"
}
extension UIFont {
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }
        
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }
        
        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            //print("Error registering font: maybe it was already registered.")
            return false
        }
        
        return true
    }
}

extension UIImage {
    static var poweredByIcon:UIImage? {
        return UIImage(named: "icon", in: Bundle.bundle, compatibleWith: nil)
    }
    static var poweredByWithText:UIImage? {
        return UIImage(named: "logoWithEngagingChoice", in: Bundle.bundle, compatibleWith: nil)
    }
}
extension UIColor {
    static var poweredByColor:UIColor {
        return UIColor(red: 52/255, green: 62/255, blue: 74/255, alpha: 1.0)
    }
}

extension Bundle {
    static var bundle:Bundle {
        let podBundle = Bundle(for: EGOfferGridViewController.self)
        let bundleURL = podBundle.url(forResource: "FabricSell", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
}
