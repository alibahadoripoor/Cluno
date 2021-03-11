//
//  OfferDetailImagesRowViewModel.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import Foundation

struct OfferDetailImagesRowViewModel{
    var imageURLs: [URL?] = []
    
    init(offerDetail: OfferDetail){
        for image in offerDetail.images{
            self.imageURLs.append(URL(string: image.src))
        }
    }
}




