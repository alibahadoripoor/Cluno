//
//  OfferDetailPriceViewModelTests.swift
//  ClunoTests
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import XCTest
@testable import Cluno

final class OfferDetailPriceViewModelTests: XCTestCase {
    var offerDetail: OfferDetail!
    var viewModel: OfferDetailPriceViewModel!
    
    override func setUp() {
        super.setUp()
        offerDetail = SampleModel.shared.sampleOfferDetail()
        viewModel = OfferDetailPriceViewModel(offerDetail: offerDetail)
    }
    
    func testOfferDetailPriceViewModel(){
        XCTAssertEqual(viewModel.priceRows.count, 3)
        XCTAssertEqual(viewModel.priceRows[0].price, "269 €")
        XCTAssertEqual(viewModel.priceRows[0].duration, "6 Monate")
        XCTAssertFalse(viewModel.priceRows[0].isSelected)
    }
    
    func testGetSelectedRow(){
        XCTAssertNotNil(viewModel.getSelectedRow())
        XCTAssertEqual(viewModel.getSelectedRow()!.price, "199 €")
    }
    
    func testSetSelectedRow(){
        viewModel.setSelectedRow(at: 1)
        XCTAssertEqual(viewModel.getSelectedRow()!.price, "440 €")
        viewModel.setSelectedRow(at: 0)
        XCTAssertEqual(viewModel.getSelectedRow()!.price, "269 €")
    }
}
