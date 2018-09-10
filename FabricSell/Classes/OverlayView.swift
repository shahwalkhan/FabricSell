//
//  OverlayView.swift
//  FabricSell
//
//  Created by KiwiTech on 04/09/18.
//

import UIKit

class OverlayView: UIView {
    // MARK: - Initialisers
    private var setup = false
    override public init(frame: CGRect) {
        super.init(frame: frame)
        if self.setup {
            applyGradient()
            NotificationCenter.default.addObserver(self, selector: #selector(deviceRotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if !setup {
            self.setup = true
            applyGradient()
            NotificationCenter.default.addObserver(self, selector: #selector(deviceRotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        }
    }
    
    func applyGradient() {
        self.layer.sublayers = nil
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.black.withAlphaComponent(0.3).cgColor, UIColor.clear.cgColor]
        self.layer.addSublayer(gradient)
    }
    
    @objc func deviceRotated(){
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                applyGradient()
//        }
        
    }
}
