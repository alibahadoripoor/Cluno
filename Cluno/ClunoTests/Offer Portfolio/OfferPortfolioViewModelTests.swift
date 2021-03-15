//
//  OfferPortfolioViewModelTests.swift
//  ClunoTests
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import XCTest
@testable import Cluno

final class OfferPortfolioViewModelTests: XCTestCase {
    private var viewModel: OfferPortfolioViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = OfferPortfolioViewModel(webService: OfferWebService(dataService: OfferPortfolioDataServiceMock()))
    }
    
    func testFetchOfferPortfolios(){
        viewModel.fetchOfferPortfolios()
        
        let expectation = XCTestExpectation(description: "Fetching Offer Portfolios was successful")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.offerPortfolios.count, 72)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
