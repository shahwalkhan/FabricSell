//
//  ECGridManager.swift
//  FabricSell
//
//  Created by KiwiTech on 04/09/18.
//

import UIKit

public class ECGridManager: NSObject {
    
    public static let shared = ECGridManager()
    
    // MARK: - Show Offer List View Controller
    /**
        This method require two paramers controller and email should not empty
        Email is mandotary to show Offer List View Cotroller
     */
    public func showOfferList(view controller:UIViewController, email:String) {
        let gridViewController = EGOfferGridViewController(nibName: "\(EGOfferGridViewController.self)", bundle: Bundle.bundle)
        controller.show(gridViewController, sender: controller)
    }

    
}
