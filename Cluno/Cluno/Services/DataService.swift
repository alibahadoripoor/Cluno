//
//  DataService.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 15.03.21.
//

import Foundation
import Combine

protocol DataServiceProtocol {
    func fetchData(for url: URL) -> URLSession.DataTaskPublisher
}

final class DataService{
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension DataService: DataServiceProtocol{
    func fetchData(for url: URL) -> URLSession.DataTaskPublisher {
        return session.dataTaskPublisher(for: url)
    }
}

