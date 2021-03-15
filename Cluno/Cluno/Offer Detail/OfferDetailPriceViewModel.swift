//
//  OfferDetailPriceViewModel.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import Foundation

struct OfferDetailPriceViewModel {
    var priceRows: [PriceRowViewModel] = []
    private var selectedRow: Int?
    
    init(offerDetail: OfferDetail){
        let lineItems = offerDetail.pricing.lineItems
        
        for item in 0..<lineItems.count{
            self.priceRows.append(
                PriceRowViewModel(
                    duration: lineItems[item].duration + " Monate",
                    price: "\(lineItems[item].price)" + " \(offerDetail.pricing.currencySymbol)",
                    isSelected: (offerDetail.pricing.lowestPrice == lineItems[item].price) ? true : false
                )
            )
            
            if offerDetail.pricing.lowestPrice == lineItems[item].price{
                selectedRow = item
            }
        }
    }
    
    func getSelectedRow() -> PriceRowViewModel?{
        guard let selectedRow = selectedRow else { return nil }
        return priceRows[selectedRow]
    }
    
    mutating func setSelectedRow(at index: Int){
        guard let selectedRow = selectedRow else { return }
        priceRows[selectedRow].isSelected = false
        priceRows[index].isSelected = true
        self.selectedRow = index
    }
}
