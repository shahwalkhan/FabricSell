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
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var offerOff: UILabel!
    @IBOutlet weak var titleHeightContraint: NSLayoutConstraint!
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        offerTitle.numberOfLines = 0;
        offerTitle.sizeToFit()
        loadFont()
    }
    
     // MARK: - Set details
    func setContent(model: Offers) {
        offerTitle.text = model.offerTitle
        offerPercentage.text = model.discount
        if model.discountType == 1 {
            offerOff.isHidden = true
        } else {
            offerOff.isHidden = false
        }
        
        if let offerEndDate = convertStringToDate(date: model.offerEndDate) {
            subTitle.text = "\(EngagingChoiceOfferText.validTill.rawValue) \(String(describing: offerEndDate))"
        }
        
        //if let offerText = model.offerTitle {
         
            
//            if offerText.count > 28 {
//                titleHeightContraint.constant = 60
//            } else {
//                titleHeightContraint.constant = 24
//            }
        //}
       
    }
    
    func convertStringToDate(date:String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = FormatterDate.YYMdHHm.rawValue
        
        let mmdyFormatter = DateFormatter()
        mmdyFormatter.dateFormat = FormatterDate.MMDY.rawValue
        
        if let date = formatter.date(from: "\(date) 00:00:00") {
            return mmdyFormatter.string(from: date)
        }
        return nil
    }
    
     // MARK: - Load Fonts
    private func loadFont() {
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-SemiBold", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-Bold", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-Regular", fontExtension: "ttf")
        offerTitle.font = UIFont(name: "OpenSans-SemiBold", size: 19)
        offerPercentage.font = UIFont(name: "OpenSans-Bold", size: 22)
        offerOff.font = UIFont(name: "OpenSans-Regular", size: 13)
    }
}
