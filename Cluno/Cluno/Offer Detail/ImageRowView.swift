//
//  ImageRowView.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 14.03.21.
//

import SwiftUI
import Kingfisher

struct ImageRowView: View {
    var url: URL?
    var body: some View {
        KFImage(url)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .shadow(radius: 3)
            .frame(width: screenWidth - 50, alignment: .center)
    }
}

struct ImageRowView_Previews: PreviewProvider {
    static var previews: some View {
        ImageRowView()
    }
}
