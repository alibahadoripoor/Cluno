//
//  OfferWebService.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 08.03.21.
//

import Foundation
import Combine

protocol OfferPortfolioWebServiceProtocol {
    func fetchOfferPortfolios() -> AnyPublisher<OfferPortfoliosObject, OfferError>
}

protocol OfferDetailWebServiceProtocol {
    func fetchOfferDetail(at id: String) -> AnyPublisher<OfferDetail, OfferError>
}

final class OfferWebService {
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension OfferWebService: OfferPortfolioWebServiceProtocol, OfferDetailWebServiceProtocol {
    private func fetchData<T>(for api: OfferEndPoints) -> AnyPublisher<T, OfferError> where T: Decodable {
        
        guard let url = api.url else {
            let error = OfferError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .mapError { error in
              .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
              decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
    func fetchOfferPortfolios() -> AnyPublisher<OfferPortfoliosObject, OfferError> {
        return fetchData(for: .offerPortfolios)
    }
    
    func fetchOfferDetail(at id: String) -> AnyPublisher<OfferDetail, OfferError> {
        return fetchData(for: .offer(id: id))
    }
}

private enum OfferEndPoints{
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



