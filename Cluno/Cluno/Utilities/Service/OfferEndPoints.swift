//
//  OfferEndPoints.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import Foundation

enum OfferEndPoints{
    case offerPortfolios
    case offer(id: String)
    
    private var scheme: String {
        return "https"
    }
    
    private var host: String {
        return "api.cluno.com"
    }
    
    private var basePath: String {
        return "/offerservice/v1/offer/"
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        
        switch self {
        case .offerPortfolios:
            components.path = basePath + "query"
            return components.url
        case let .offer(id: id):
            components.path = basePath + id
            return components.url
        }
    }
}
