//
//  OfferDetailDataServiceMock.swift
//  ClunoTests
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import Foundation
@testable import Cluno

final class OfferDetailDataServiceMock: DataServiceProtocol {
    func fetchData(for url: URL) -> URLSession.DataTaskPublisher {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "OfferDetailMock", withExtension: "json")!
        return URLSession.shared.dataTaskPublisher(for: url)
    }
}
