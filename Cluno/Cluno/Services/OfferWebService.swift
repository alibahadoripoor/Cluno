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
    private var dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
}

extension OfferWebService: OfferPortfolioWebServiceProtocol, OfferDetailWebServiceProtocol {
    private func fetchData<T>(for endPoint: OfferEndPoints) -> AnyPublisher<T, OfferError> where T: Decodable {
        
        guard let url = endPoint.url else {
            let error = OfferError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return dataService.fetchData(for: url)
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
