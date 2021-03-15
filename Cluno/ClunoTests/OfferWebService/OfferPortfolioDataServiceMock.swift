//
//  OfferPortfolioDataServiceMock.swift
//  ClunoTests
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import XCTest
@testable import Cluno

final class OfferPortfolioDataServiceMock: DataServiceProtocol {
    func fetchData(for url: URL) -> URLSession.DataTaskPublisher {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "OfferPortfolioMock", withExtension: "json")!
        return URLSession.shared.dataTaskPublisher(for: url)
    }
}
