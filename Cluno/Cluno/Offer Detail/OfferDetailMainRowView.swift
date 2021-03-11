//
//  OfferDetailMainRowView.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import SwiftUI

struct OfferDetailMainRowView: View {
    private var viewModel: OfferDetailMainRowViewModel
    
    init(viewModel: OfferDetailMainRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            Text(viewModel.model)
                .font(.title2)
                .bold()
            Text(viewModel.version)
                .font(.title3)
            Text(viewModel.deliveryTime)
                .font(.title3)
                .fontWeight(.medium)
        }
    }
}
