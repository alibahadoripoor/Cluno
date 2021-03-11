//
//  OfferModel.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 10.03.21.
//

import Foundation

struct OfferPortfoliosObject: Decodable {
    let count: Int
    let items: [OfferPortfolio]
}

struct OfferPortfolio: Decodable {
    let id: String
    let car: Car
    let teaser: Teaser
    let pricing: Price
}

struct OfferDetail: Decodable {
    let id: String
    let estimatedDeliveryTime: String
    let car: Car
    let images: [CarImage]
    let pricing: Price
    
    struct CarImage: Decodable {
        let src: String
    }
}

struct Car: Decodable {
    let make: String
    let model: String
    let version: String
}

struct Teaser: Decodable {
    let teaserImage: String
}

struct Price: Decodable {
    let lineItems: [PriceItem]
    let lowestPrice: Int
    let currencySymbol: String
    
    struct PriceItem: Decodable {
        let duration: String
        let price: Int
    }
}
