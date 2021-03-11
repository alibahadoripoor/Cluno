//
//  OfferDetailViewModel.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import Foundation
import Combine

final class OfferDetailViewModel: ObservableObject {
    @Published var imagesRowViewModel: OfferDetailImagesRowViewModel?
    @Published var mainRowViewModel: OfferDetailMainRowViewModel?
    @Published var pricesRowViewModel: OfferDetailPriceRowViewModel?
    
    private var webService: OfferDetailWebServiceProtocol
    private var disposables = Set<AnyCancellable>()
    var offerId: String
    
    init(webService: OfferDetailWebServiceProtocol = OfferWebService(), offerId: String) {
        self.webService = webService
        self.offerId = offerId
    }
    
    func fetchOfferDetail(){
        webService.fetchOfferDetail(at: offerId)
            .map { response in
                (
                    OfferDetailImagesRowViewModel(offerDetail: response),
                    OfferDetailMainRowViewModel(offerDetail: response),
                    OfferDetailPriceRowViewModel(offerDetail: response)
                )
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (value) in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.imagesRowViewModel = nil
                    self.mainRowViewModel = nil
                    self.pricesRowViewModel = nil
                case .finished:
                    break
                }
                
            } receiveValue: { [weak self] (imagesRowViewModel, mainRowViewModel, pricesRowViewModel) in
                guard let self = self else { return }
                self.imagesRowViewModel = imagesRowViewModel
                self.mainRowViewModel = mainRowViewModel
                self.pricesRowViewModel = pricesRowViewModel
            }
            .store(in: &disposables)
    }
}
