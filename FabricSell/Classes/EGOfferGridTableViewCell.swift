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
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
