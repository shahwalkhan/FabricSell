//
//  ECOfferViewModel.swift
//  FabricSell
//
//  Created by KiwiTech on 05/09/18.
//

import UIKit
import Alamofire
class ECOfferViewModel {
    
    var offerList = [Offers]()
    var baseURL: String?
    internal func fetchOfferList(callback:@escaping () -> Void)  {
        // String url address for offerlist 
        let stringURL = EngagingChoiceAPI.StagOfferListURL.rawValue
        // Make sure URL is nil before making request to server
        guard let url = URL(string: stringURL) else { return }
        
        // Download data from server
        ECDownloadManager.shared.downloadData(with: url, success: { (dataModel) in
            if let list = dataModel?.data {
                self.offerList = list
                self.baseURL = dataModel?.pagination?.fileURL
                callback()
            }
        }) { (error) in
            //    PUT Some meaningfull message here
        }
    }
    
    // MARK: - Convert string date to MMM dd, yyyy
    class func convertStringToDate(date:String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = FormatterDate.YYMdHHm.rawValue
        
        let mmdyFormatter = DateFormatter()
        mmdyFormatter.dateFormat = FormatterDate.MMDY.rawValue
        
        if let date = formatter.date(from: "\(date) 00:00:00") {
            return mmdyFormatter.string(from: date)
        }
        return nil
    }
}
