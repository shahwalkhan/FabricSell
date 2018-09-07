//
//  ECOfferModel.swift
//  FabricSell
//
//  Created by KiwiTech on 05/09/18.
//

import UIKit

struct ECOfferModel: Codable {
    var pagination: Pagination?
    var data: [Offers]?
//    var detail:String?
//    var serverDateTime:String?
//    enum CodingKeys: String, CodingKey {
//        case serverDateTime = "server_datetime"
//    }
}
struct Pagination: Codable {
    var count: Int?
    var perPage: Int?
    var numbeOfPages: Int?
    var fileURL: String?
    private enum CodingKeys: String, CodingKey {
        case count
        case perPage = "per_page"
        case numbeOfPages = "num_page"
        case fileURL = "file_url"
    }
}

struct Offers: Codable {
    var id: Int?
    var tracingNumber: String?
    var offerTitle: String?
    var offerDescription: String?
    var offerStartDate: String?
    var offerEndDate: String?
    var offerURL: String?
    var offerBudget: String?
    var priceEngagement: String?
    var coupanCode: String?
    var NumberOfUser: Int?
    var OfferUsesTime: Int?
    var status: Int?
    var fileName: String?
    var fileType: Int?
    var discount: String?
    var discountType: Int?
    private enum CodingKeys: String, CodingKey {
        case id
        case tracingNumber = "tracking_number"
        case offerTitle = "offer_title"
        case offerDescription = "offer_description"
        case offerStartDate = "offer_start_date"
        case offerEndDate = "offer_end_date"
        case offerURL = "offer_url"
        case offerBudget = "offer_budget"
        case priceEngagement = "price_engagement"
        case coupanCode = "coupan_code"
        case NumberOfUser = "number_of_uses"
        case OfferUsesTime = "offer_uses_time"
        case status
        case fileName = "file_name"
        case fileType = "file_type"
        case discount = "discount"
        case discountType = "discount_type"
    }
}
