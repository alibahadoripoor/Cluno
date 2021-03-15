//
//  OfferDetailImageViewModelTests.swift
//  ClunoTests
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import XCTest
@testable import Cluno

final class OfferDetailImageViewModelTests: XCTestCase {
    func testOfferDetailImageViewModel(){
        let offerDetail = SampleModel.shared.sampleOfferDetail()
        let viewModel = OfferDetailImageViewModel(offerDetail: offerDetail)
        
        XCTAssertEqual(viewModel.imageURLs.count, 2)
    }
}


