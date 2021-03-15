//
//  SampleModel.swift
//  ClunoTests
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import Foundation
@testable import Cluno

class SampleModel {
    static let shared = SampleModel()
    
    let id = "115"
    let estimatedDeliveryTime = "in ca. 3-4 Monaten"
    let car = Car(
        make: "Opel",
        model: "Corsa",
        version: "EDITION")
    let teaser = Teaser(teaserImage: "https://assets.cluno.com/2019/02/115_1_black.jpg")
    let pricing = Price(
        lineItems: [
            Price.PriceItem(duration: "6", price: 269),
            Price.PriceItem(duration: "7", price: 440),
            Price.PriceItem(duration: "5", price: 199)
        ],
        lowestPrice: 199,
        currencySymbol: "€")
    let images = [
        OfferDetail.CarImage(src: "https://assets.cluno.com/2019/02/115_1_black.jpg"),
        OfferDetail.CarImage(src: "https://assets.cluno.com/2019/02/115_2_black.jpg")
    ]
    
    func sampleOfferPortfolio() -> OfferPortfolio{
        return OfferPortfolio(id: id, car: car, teaser: teaser, pricing: pricing)
    }
    
    func sampleOfferDetail() -> OfferDetail{
        return OfferDetail(id: id, estimatedDeliveryTime: estimatedDeliveryTime, car: car, images: images, pricing: pricing)
    }
}
