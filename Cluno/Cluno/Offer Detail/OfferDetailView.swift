//
//  OfferDetailView.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import SwiftUI

struct OfferDetailView: View {
    @ObservedObject var viewModel: OfferDetailViewModel
    
    init(viewModel: OfferDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if let imagesRowViewModel = viewModel.imagesRowViewModel{
                OfferDetailImagesRowView(viewModel: imagesRowViewModel)
            }
            if let mainRowViewModel = viewModel.mainRowViewModel{
                OfferDetailMainRowView(viewModel: mainRowViewModel)
            }
            if let pricesRowViewModel = viewModel.pricesRowViewModel{
                OfferDetailPriceRowView(viewModel: pricesRowViewModel)
                    .padding()
            }
            Spacer()
        }
        .navigationBarTitle(viewModel.mainRowViewModel?.model ?? "")
        .onAppear(){
            viewModel.fetchOfferDetail()
        }
    }
}

struct OfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(viewModel: OfferDetailViewModel(offerId: "1"))
    }
}
