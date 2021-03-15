//
//  OfferWebServiceTests.swift
//  ClunoTests
//
//  Created by Mohammadali Bahadoripoor on 14.03.21.
//

import XCTest
import Combine
@testable import Cluno

final class OfferWebServiceTests: XCTestCase {
    private var offerPortfolioWebService: OfferPortfolioWebServiceProtocol!
    private var offerDetailWebService: OfferDetailWebServiceProtocol!
    private var disposables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        offerPortfolioWebService = OfferWebService(dataService: OfferPortfolioDataServiceMock())
        offerDetailWebService = OfferWebService(dataService: OfferDetailDataServiceMock())
    }
    
    func testFetchOfferPortfolios(){
        let expectation = XCTestExpectation(description: "Fetching Offer Portfolios was successful")
        
        offerPortfolioWebService.fetchOfferPortfolios()
            .sink { _ in } receiveValue: { (offerPortfolios) in
                XCTAssertNotNil(offerPortfolios)
                XCTAssertEqual(offerPortfolios.items.count, 72)
                expectation.fulfill()
            }
            .store(in: &disposables)
        
        wait(for: [expectation], timeout: 1)
    }

    func testFetchOfferDetail(){
        let expectation = XCTestExpectation(description: "Fetching Offer Detail was successful")
        
        offerDetailWebService.fetchOfferDetail(at: "296")
            .sink { _ in } receiveValue: { (offerDetail) in
                XCTAssertEqual(offerDetail.id, "296")
                expectation.fulfill()
            }
            .store(in: &disposables)
        
        wait(for: [expectation], timeout: 1)
    }
}
