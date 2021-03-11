//
//  OfferError.swift
//  Cluno
//
//  Created by Mohammadali Bahadoripoor on 09.03.21.
//

import Foundation

enum OfferError: Error{
    case network(description: String)
    case parsing(description: String)
}
