//
//  OfferDetailMainViewModelTests.swift
//  ClunoTests
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import XCTest
@testable import Cluno

final class OfferDetailMainViewModelTests: XCTestCase {
    func testOfferDetailMainViewModel(){
        let offerDetail = SampleModel.shared.sampleOfferDetail()
        let viewModel = OfferDetailMainViewModel(offerDetail: offerDetail)
        
        XCTAssertEqual(viewModel.model, "Opel Corsa")
        XCTAssertEqual(viewModel.version, "EDITION")
        XCTAssertEqual(viewModel.deliveryTime, "Verfügbar in ca. 3-4 Monaten")
    }
}
