//
//  ECGridView.swift
//  EngagingChoice
//
//  Created by KiwiTech on 30/08/18.
//  Copyright © 2018 KiwiTech. All rights reserved.
//

import UIKit

class ECGridView: UIView {
    @IBInspectable open var enabledPowerBy: Bool = true {
        didSet {
            if powerByThumImageView != nil {
                powerByThumImageView.isHidden = !enabledPowerBy
            }
        }
    }
    fileprivate(set) var isSetup = false
    open var coverImageView:UIImageView!
    fileprivate var powerByThumImageView:UIImageView!
    fileprivate var shouldSetupConstraints = true
    
    // MARK: - Initialisers
    override public init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        setupAccessibility()
        setupConstraints()
        
        isSetup = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // Since awakeFromNib can be called multiple times we check to see if setup routines have been called already for safety
        if !isSetup {
            
            setup()
            setupAccessibility()
            setupConstraints()
            
            isSetup = true
        }
    }
    
    
    // MARK: - Setup
    /**
     Abstract setup method for initial setup of the view and all its subviews.
     Override this function to initialize subviews, set default values, etc.
     */
    func setup() {
        // Abstract method.
        coverImageView = UIImageView(frame: CGRect.zero)
        coverImageView.backgroundColor = UIColor.gray
        coverImageView.contentMode = self.contentMode
        self.addSubview(coverImageView)
        
        powerByThumImageView = UIImageView(frame: CGRect.zero)
        powerByThumImageView.backgroundColor = UIColor.black
        powerByThumImageView.contentMode = .scaleToFill
        powerByThumImageView.image = UIImage(named: "icon")
        powerByThumImageView.isHidden = !enabledPowerBy
        self.addSubview(powerByThumImageView)
    }
    
    
    // MARK: - Accessibility
    /**
     Setup for the view's accessibility
     - It is best to use this for static identifiers that will not change at runtime.
     For dynamically generated identifiers or identifiers that will change over time, we recommend doing this in the view controller or view model as appropriate.
     */
    func setupAccessibility() {
        // Abstract method.
    }
    
    
    // MARK: - Constraints
    /**
     Abstract setup method for the view's constraints.
     Override this function to add layout constraints for all the subviews.
     */
    func setupConstraints() {
        if(shouldSetupConstraints) {
            powerByThumImageView.translatesAutoresizingMaskIntoConstraints = false
            coverImageView.translatesAutoresizingMaskIntoConstraints = false
            // AutoLayout constraints
            addConstraint(NSLayoutConstraint(item: powerByThumImageView,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: nil,
                                             attribute: .notAnAttribute,
                                             multiplier: 1,
                                             constant: 30))
            addConstraint(NSLayoutConstraint(item: powerByThumImageView,
                                             attribute: .width,
                                             relatedBy: .equal,
                                             toItem: nil,
                                             attribute: .notAnAttribute,
                                             multiplier: 1,
                                             constant: 28))
            addConstraint(NSLayoutConstraint(item: powerByThumImageView,
                                             attribute: .trailing,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .trailing,
                                             multiplier: 1,
                                             constant:0))
            addConstraint(NSLayoutConstraint(item: powerByThumImageView,
                                             attribute: .bottom,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .bottom,
                                             multiplier: 1,
                                             constant: 0))
            
            addConstraint(NSLayoutConstraint(item: coverImageView,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .top,
                                             multiplier: 1,
                                             constant: 0))
            addConstraint(NSLayoutConstraint(item: coverImageView,
                                             attribute: .leading,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .leading,
                                             multiplier: 1,
                                             constant: 0))
            addConstraint(NSLayoutConstraint(item: coverImageView,
                                             attribute: .trailing,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .trailing,
                                             multiplier: 1,
                                             constant: 0))
            addConstraint(NSLayoutConstraint(item: coverImageView,
                                             attribute: .bottom,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .bottom,
                                             multiplier: 1,
                                             constant: 0))
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    // MARK: - Download Image
    /**
     SetImage download image from server and show in ECGridView
     */
    open func set(image url:URL) {
        self.coverImageView.image = nil
        ECDownloadManager.shared.downloadImage(with: url, success: { (data) in
            self.coverImageView.image = UIImage(data: data)
        }) { (error) in
            print("eror \(String(describing: error?.localizedDescription))")
        }
    }
    
    // MARK: - Download Image with callback
    /**
     SetImage download image from server with callback and show in ECGridView
     */
    open func set(image url:URL, success:@escaping (_ data:Data) -> Void, failed:@escaping (_ error:Error?) -> Void) {
        self.coverImageView.image = nil
        ECDownloadManager.shared.downloadImage(with: url, success: { (data) in
            self.coverImageView.image = UIImage(data: data)
            success(data)
        }) { (error) in
            failed(error)
        }
    }
}
