//
//  OfferDetailPriceRowView.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import SwiftUI

struct OfferDetailPriceRowView: View {
    private var viewModel: OfferDetailPriceRowViewModel
    
    init(viewModel: OfferDetailPriceRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Mindestlaufzeit")
            
            ForEach(0..<viewModel.prices.count) {  item in
                
                PriceRowView(price: viewModel.prices[item])
                
                if item < viewModel.prices.count - 1{
                    Divider()
                }
            }

        }
        .padding()
        .colorMultiply(Color(.systemGray5))
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}


struct PriceRowView: View {
    private var price: (String, String)
    
    init(price: (String, String)) {
        self.price = price
    }
    
    var body: some View {
        HStack{
            Text(price.0)
                .bold()
            Spacer()
            Text(price.1)
                .bold()
        }
    }
}
