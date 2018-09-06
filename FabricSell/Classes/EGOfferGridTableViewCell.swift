//
//  EGOfferGridTableViewCell.swift
//  FabricSell
//
//  Created by KiwiTech on 03/09/18.
//

import UIKit

open class EGOfferGridTableViewCell: UITableViewCell {

    @IBOutlet weak var bannderImageView: UIImageView!
    @IBOutlet weak var offerTitle: UILabel!
    @IBOutlet weak var offerPercentage: UILabel!
    @IBOutlet weak var offerOff: UILabel!
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadFont()
    }
    
    func setContent(model: Offers) {
        offerTitle.text = model.offerTitle
//        offerOff.isHidden = true
        offerPercentage.text = model.discount
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func loadFont() {
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-SemiBold", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-Bold", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-Regular", fontExtension: "ttf")
        offerTitle.font = UIFont(name: "OpenSans-SemiBold", size: 19)
        offerPercentage.font = UIFont(name: "OpenSans-Bold", size: 22)
        offerOff.font = UIFont(name: "OpenSans-Regular", size: 13)
    }
}
