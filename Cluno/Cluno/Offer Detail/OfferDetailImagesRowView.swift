//
//  OfferDetailImagesRowView.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import SwiftUI
import Kingfisher

struct OfferDetailImagesRowView: View {
    private var viewModel: OfferDetailImagesRowViewModel
    
    private var screenWidth: CGFloat{
        return UIScreen.main.bounds.width
    }
    
    init(viewModel: OfferDetailImagesRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(viewModel.imageURLs, id: \.self) { url in
                    KFImage(url)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .frame(width: screenWidth - 50, alignment: .center)
                }
            }
            .padding()
        }
    }
}
