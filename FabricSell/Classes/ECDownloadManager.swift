//
//  ECDownloadManager.swift
//  EngagingChoice
//
//  Created by KiwiTech on 30/08/18.
//  Copyright © 2018 KiwiTech. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire

class ECDownloadManager: NSObject {
    
    // MARK: - Class shared instance
    static let shared = ECDownloadManager()
    
    // MARK: - Make init private
    private override init() {}
    
    // MARK: - Download Data from server by making a request
    func downloadData(with url:URL, success:@escaping(_ data:ECOfferModel?) -> Void, failed:@escaping (_ error:Error?) -> Void) {
        Alamofire.request(url).responseJSON { response in
            if let data = response.data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let model = try jsonDecoder.decode(ECOfferModel.self, from: data)
                    success(model)
                }
                catch let error  {
                    failed(error)
                }
            }
        }

    }
}
