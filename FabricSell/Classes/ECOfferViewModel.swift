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
        let stringURL = EngagingChoiceAPI.offerListURL.rawValue
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

}
