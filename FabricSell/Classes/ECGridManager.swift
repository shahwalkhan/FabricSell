//
//  ECGridManager.swift
//  FabricSell
//
//  Created by KiwiTech on 04/09/18.
//

import UIKit

public class ECGridManager: NSObject {
    
    public static let shared = ECGridManager()
    fileprivate static var secretKey:String?
    internal var getSecretKey:String? {
        if (ECGridManager.secretKey == nil) {
            print("Secret key is not provided, Please set Secret key in ECGrimanager.config(secretKey key:String) and add this line of code in didFinishLaunchingWithOptions")
        }
        return ECGridManager.secretKey
    }
    
    // MARK: - Config Key
    /**
        Add your secret key here
     */
    public static func config(secretKey key:String) {
        ECGridManager.secretKey = key
    }
    
    // MARK: - Show Offer List View Controller
    /**
        Provide viewController to open OfferList View
        Email is mandotary to show Offer List View Cotroller
     */
    public func showOfferList(view controller:UIViewController, email:String) {
        let gridViewController = EGOfferGridViewController(nibName: "\(EGOfferGridViewController.self)", bundle: Bundle.bundle)
        controller.present(gridViewController, animated: true, completion: nil)
    }

    
}
