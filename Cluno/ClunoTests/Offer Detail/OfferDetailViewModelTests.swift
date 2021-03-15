//
//  OfferDetailViewModelTests.swift
//  ClunoTests
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import XCTest
@testable import Cluno

final class OfferDetailViewModelTests: XCTestCase {
    private var viewModel: OfferDetailViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = OfferDetailViewModel(webService: OfferWebService(dataService: OfferDetailDataServiceMock()), offerId: "269")
    }
    
    func testFetchOfferDetail(){
        viewModel.fetchOfferDetail()
        
        let expectation = XCTestExpectation(description: "Fetching Offer Detail was successful")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            XCTAssertNotNil(self?.viewModel.imageViewModel)
            XCTAssertNotNil(self?.viewModel.mainViewModel)
            XCTAssertNotNil(self?.viewModel.priceViewModel)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetTitle(){
        viewModel.fetchOfferDetail()
        
        let expectation = XCTestExpectation(description: "Getting Title was successful")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            XCTAssertEqual(self?.viewModel.getTitle(), "Fiat 500")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetSelectedPrice(){
        viewModel.fetchOfferDetail()
        
        let expectation = XCTestExpectation(description: "Getting Selected Price was successful")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            XCTAssertEqual(self?.viewModel.getSelectedPrice(), "189 €")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testSetSelectedPrice(){
        viewModel.fetchOfferDetail()
        
        let expectation = XCTestExpectation(description: "Setting Selected Price was successful")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.viewModel.setSelectedPrice(at: 0)
            XCTAssertEqual(self?.viewModel.getSelectedPrice(), "249 €")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
