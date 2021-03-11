//
//  OfferDetailPriceRowViewModel.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import Foundation

struct OfferDetailPriceRowViewModel {
    var prices: [(String,String)] = []
    
    init(offerDetail: OfferDetail){
        for item in offerDetail.pricing.lineItems{
            self.prices.append((item.duration + " Monate", "\(item.price) €"))
        }
    }
}
