//
//  OfferPortfolioRowView.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 10.03.21.
//

import SwiftUI
import Kingfisher

struct OfferPortfolioRowView: View {
    private var viewModel: OfferPortfolioRowViewModel
    
    init(viewModel: OfferPortfolioRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading){
            KFImage(viewModel.imageURL)
                .resizable()
                .scaledToFit()
            Text(viewModel.title)
                .font(.title2)
                .bold()
                .padding([.leading, .trailing])
                .lineLimit(1)
            HStack {
                Text("ab")
                    .font(.title3)
                Text(viewModel.price)
                    .font(.title3)
                    .bold()
                    .foregroundColor(.purple)
                Text("pro Monat")
                    .font(.title3)
            }
                .padding([.leading, .bottom, .leading])
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 3)
        .padding([.top, .bottom], 8)
        .padding([.leading, .trailing], 16)
    }
}

