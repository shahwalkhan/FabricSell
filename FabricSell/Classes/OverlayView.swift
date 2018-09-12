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
        if !self.setup {
            self.setup = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.applyGradient()
            }
            applyGradient()
            NotificationCenter.default.addObserver(self, selector: #selector(deviceRotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if !self.setup {
            self.setup = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.applyGradient()
            }
            NotificationCenter.default.addObserver(self, selector: #selector(deviceRotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        }
    }
    
    func applyGradient() {
        self.layer.sublayers = nil
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.black.withAlphaComponent(0.3).cgColor,UIColor.black.withAlphaComponent(0.0).cgColor, UIColor.black.withAlphaComponent(0.3).cgColor]
        gradient.locations = [0,1, 0]
        self.layer.addSublayer(gradient)

    }
    
    @objc func deviceRotated(){
        applyGradient()
    }
}
