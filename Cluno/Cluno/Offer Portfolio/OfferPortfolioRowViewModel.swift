//
//  OfferPortfolioRowViewModel.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 10.03.21.
//

import Foundation

struct OfferPortfolioRowViewModel: Identifiable {
    var id: String
    var imageURL: URL?
    var title: String
    var price: String
    
    init(offerPortfolio: OfferPortfolio) {
        self.id = offerPortfolio.id
        self.imageURL = URL(string: offerPortfolio.teaser.teaserImage)
        self.title = offerPortfolio.car.make + " " + offerPortfolio.car.model + " " + offerPortfolio.car.version
        self.price = "ab \(offerPortfolio.pricing.lowestPrice) \(offerPortfolio.pricing.currencySymbol)"
    }
}
