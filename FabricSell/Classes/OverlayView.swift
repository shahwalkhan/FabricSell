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
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if !setup {
            self.setup = true
            applyGradient()
        }
    }
    func applyGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.black.withAlphaComponent(0.4).cgColor, UIColor.clear.cgColor]
        self.layer.addSublayer(gradient)
        self.backgroundColor = .clear
    }
}
