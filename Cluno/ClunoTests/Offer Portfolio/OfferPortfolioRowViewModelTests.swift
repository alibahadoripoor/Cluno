//
//  OfferPortfolioRowViewModelTests.swift
//  ClunoTests
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import XCTest
@testable import Cluno

final class OfferPortfolioRowViewModelTests: XCTestCase {
    func testOfferPortfolioRowViewModel(){
        let offerPortfolio = SampleModel.shared.sampleOfferPortfolio()
        let viewModel = OfferPortfolioRowViewModel(offerPortfolio: offerPortfolio)
        
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.id, "115")
        XCTAssertEqual(viewModel.title, "Opel Corsa EDITION")
        XCTAssertEqual(viewModel.imageURL, URL(string: "https://assets.cluno.com/2019/02/115_1_black.jpg"))
        XCTAssertEqual(viewModel.price, "ab 199 €")
    }
}


