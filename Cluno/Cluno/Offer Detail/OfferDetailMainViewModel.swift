//
//  OfferDetailMainViewModel.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import Foundation

struct OfferDetailMainViewModel {
    var model: String
    var version: String
    var deliveryTime: String
    
    init(offerDetail: OfferDetail){
        self.model = offerDetail.car.make + " " + offerDetail.car.model
        self.version = offerDetail.car.version
        self.deliveryTime = "Verfügbar " + offerDetail.estimatedDeliveryTime
    }
}
