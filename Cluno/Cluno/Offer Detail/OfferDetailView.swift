//
//  OfferDetailView.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import SwiftUI
import Kingfisher

struct OfferDetailView: View {
    @ObservedObject var viewModel: OfferDetailViewModel
    
    init(viewModel: OfferDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            OfferDetailImageView
            OfferDetailMainView
            PacketView
            OfferDetailPriceView
            Spacer()
            WeiterButtonView
        }
        .navigationBarTitle(viewModel.getTitle())
        .onAppear(){
            viewModel.fetchOfferDetail()
        }
    }
}

extension OfferDetailView{
    var OfferDetailImageView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                if let imageViewModel = viewModel.imageViewModel {
                    ForEach(imageViewModel.imageURLs, id: \.self) { url in
                        ImageRowView(url: url)
                    }
                }
            }
            .padding()
        }
    }
    
    var OfferDetailMainView: some View {
        VStack{
            if let mainViewModel = viewModel.mainViewModel{
                Text(mainViewModel.model)
                    .font(.title2)
                    .bold()
                Text(mainViewModel.version)
                    .font(.title3)
                Text(mainViewModel.deliveryTime)
                    .font(.title3)
                    .fontWeight(.medium)
            }
        }
    }
    
    var OfferDetailPriceView: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("Mindestlaufzeit")
                .padding([.top,.leading,.trailing])
            VStack{
                if let priceViewModel = viewModel.priceViewModel{
                    ForEach(0..<priceViewModel.priceRows.count) { item in
                        
                        Button(action: {
                            viewModel.setSelectedPrice(at: item)
                        }){
                            PriceRowView(viewModel: priceViewModel.priceRows[item])
                        }

                        if item < priceViewModel.priceRows.count - 1{
                            Divider()
                        }
                    }
                    .listRowBackground(Color(.systemGray5))
                }
            }
            .padding()
        }
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .shadow(radius: 3)
        .padding()
    }
    
    var PacketView: some View {
        HStack {
            Text("Dein Paket")
                .font(.system(size: 22, weight: .bold, design: .default))
            Spacer()
            Text(viewModel.getSelectedPrice())
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(Color("MyPink"))
        }
        .padding([.top, .leading, .trailing])
    }
    
    var WeiterButtonView: some View {
        Button(action: {
            //TODO: Make a link to the next page
        }, label: {
            Text("WEITER")
                .frame(width: screenWidth - 32, height: 50, alignment: .center)
        })
        .background(Color("MyPink"))
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct OfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(viewModel: OfferDetailViewModel(offerId: "1"))
    }
}

