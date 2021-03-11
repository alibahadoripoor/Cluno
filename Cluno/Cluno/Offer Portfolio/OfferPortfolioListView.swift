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
            ScrollView {
                LazyVStack{
                    ForEach(viewModel.offerPortfolios) { offerPortfolio in
                        ZStack{
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
            .navigationBarTitle("Cluno", displayMode: .inline)
        }
        .accentColor(Color("MyPink"))
        .onAppear() {
            viewModel.fetchOfferPortfolios()
        }
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
