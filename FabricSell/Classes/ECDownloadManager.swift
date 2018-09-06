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
    
    static let shared = ECDownloadManager()
    
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
