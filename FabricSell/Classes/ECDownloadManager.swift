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
    
    func downloadImage(with url:URL, success:@escaping(_ data:Data) -> Void, failed:@escaping (_ error:Error?) -> Void) {
        
        
    }
}
