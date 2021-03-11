//
//  OfferPortfolioListViewModel.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 10.03.21.
//

import Foundation
import Combine

final class OfferPortfolioListViewModel: ObservableObject {
    @Published var offerPortfolios: [OfferPortfolioRowViewModel] = []
    
    private var webService: OfferPortfolioWebServiceProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(webService: OfferPortfolioWebServiceProtocol = OfferWebService()) {
        self.webService = webService
    }
    
    func fetchOfferPortfolios(){
        webService.fetchOfferPortfolios()
            .map { response in
                response.items.map { OfferPortfolioRowViewModel(offerPortfolio: $0) }
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (value) in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.offerPortfolios = []
                case .finished:
                    break
                }
                
            } receiveValue: { [weak self] (offerPortfolios) in
                guard let self = self else { return }
                self.offerPortfolios = offerPortfolios
            }
            .store(in: &disposables)
    }
}


