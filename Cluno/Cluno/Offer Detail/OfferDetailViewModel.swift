//
//  OfferDetailViewModel.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 11.03.21.
//

import Foundation
import Combine

final class OfferDetailViewModel: ObservableObject {
    @Published var imageViewModel: OfferDetailImageViewModel?
    @Published var mainViewModel: OfferDetailMainViewModel?
    @Published var priceViewModel: OfferDetailPriceViewModel?
    
    private var webService: OfferDetailWebServiceProtocol
    private var disposables = Set<AnyCancellable>()
    private var offerId: String
    
    init(webService: OfferDetailWebServiceProtocol = OfferWebService(), offerId: String) {
        self.webService = webService
        self.offerId = offerId
    }
    
    func fetchOfferDetail(){
        webService.fetchOfferDetail(at: offerId)
            .map { response in
                (
                    OfferDetailImageViewModel(offerDetail: response),
                    OfferDetailMainViewModel(offerDetail: response),
                    OfferDetailPriceViewModel(offerDetail: response)
                )
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (value) in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.imageViewModel = nil
                    self.mainViewModel = nil
                    self.priceViewModel = nil
                case .finished:
                    break
                }
                
            } receiveValue: { [weak self] (imagesRowViewModel, mainRowViewModel, pricesRowViewModel) in
                guard let self = self else { return }
                self.imageViewModel = imagesRowViewModel
                self.mainViewModel = mainRowViewModel
                self.priceViewModel = pricesRowViewModel
            }
            .store(in: &disposables)
    }
    
    func getTitle() -> String {
        return mainViewModel?.model ?? ""
    }
    
    func getSelectedPrice() -> String {
        return priceViewModel?.getSelectedRow()?.price ?? ""
    }
    
    func setSelectedPrice(at index: Int){
        priceViewModel?.setSelectedRow(at: index)
    }
}
