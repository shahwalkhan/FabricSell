//
//  EGGridView.swift
//  FabricSell
//
//  Created by apple on 01/09/18.
//

import UIKit

open class EGGridView: UIView {
    
    private(set) var isSetup = true
    private var updateConstraint = true
    
    private var coverImageView:UIImageView!

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func awakeFromNib() {
        
        if isSetup  {
            isSetup = false
          // do some stuff here
            coverImageView = UIImageView(frame: CGRect.zero)
            coverImageView.contentMode = self.contentMode
            self.addSubview(coverImageView)
        }
    }
    
    override open func updateConstraints() {
        
        if updateConstraint {
            updateConstraint = false
            
            addConstraint(NSLayoutConstraint(item: coverImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: coverImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: coverImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0))
            addConstraint(NSLayoutConstraint(item: coverImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0))
        }
        super.updateConstraints()
    }
    
    public func setImage(with url:URL) {
        self.coverImageView.image = nil
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if data != nil && error == nil {
                self.coverImageView.image = UIImage(data: data!)
            } else {
                // Set Placeholder image here ..
            }
        }
    }
    
    public func setImage(with url:URL, success:@escaping (_ data:Data)->Void, failed:@escaping (_ error:Error?)->Void) {
        self.coverImageView.image = nil
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if data != nil && error == nil {
                success(data!)
            } else {
                failed(error)
            }
        }
    }
}
