//
//  OfferPortfolioView.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 10.03.21.
//

import SwiftUI

struct OfferPortfolioView: View {
    @ObservedObject var viewModel: OfferPortfolioViewModel
    
    init(viewModel: OfferPortfolioViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            OfferPortfolioListView
                .navigationBarTitle("Cluno", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color("MyPink"))
        .onAppear() {
            viewModel.fetchOfferPortfolios()
        }
    }
}

extension OfferPortfolioView{
    var OfferPortfolioListView: some View {
        ScrollView {
            LazyVStack{
                ForEach(viewModel.offerPortfolios) { offerPortfolio in
                    let offerDetailViewModel = OfferDetailViewModel(offerId: offerPortfolio.id)
                    NavigationLink(destination: OfferDetailView(viewModel: offerDetailViewModel)) {
                        OfferPortfolioRowView(viewModel: offerPortfolio)
                            .shadow(radius: 3)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

