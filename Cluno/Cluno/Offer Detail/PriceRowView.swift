//
//  PriceRowView.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import SwiftUI

struct PriceRowView: View {
    private var viewModel: PriceRowViewModel
    
    init(viewModel: PriceRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack{
            Text(viewModel.duration)
                .bold()
                .foregroundColor(viewModel.isSelected ? Color("MyPink") : Color(.label))
            Spacer()
            Text(viewModel.price)
                .bold()
                .foregroundColor(viewModel.isSelected ? Color("MyPink") : Color(.label))
        }
    }
}
