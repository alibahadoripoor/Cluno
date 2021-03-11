//
//  OfferPortfolioList.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 10.03.21.
//

import SwiftUI

struct OfferPortfolioListView: View {
    @ObservedObject var viewModel: OfferPortfolioListViewModel
    
    init(viewModel: OfferPortfolioListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            List() {
                ForEach(viewModel.offerPortfolios) { offerPortfolio in
                    let offerDetailViewModel = OfferDetailViewModel(offerId: offerPortfolio.id)
                    NavigationLink(destination: OfferDetailView(viewModel: offerDetailViewModel)) {
                        OfferPortfolioRowView(viewModel: offerPortfolio)
                            .listRowInsets(EdgeInsets())
                            .background(Color(.systemBackground))
                    }
                }
            }
            .navigationBarTitle("Cluno", displayMode: .inline)
            .padding(.top, 8)
        }
        .onAppear(perform: viewModel.fetchOfferPortfolios)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OfferPortfolioListView(viewModel: OfferPortfolioListViewModel())
            OfferPortfolioListView(viewModel: OfferPortfolioListViewModel())
                .colorScheme(.dark)
        }
    }
}
