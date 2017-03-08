//
//  Currency.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 08/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import Foundation

enum Currency {
  case rub
  case usd
  case eur
  case gbp
  
  var identifier: String {
    switch self {
    case .rub: return "RUB"
    case .usd: return "USD"
    case .eur: return "EUR"
    case .gbp: return "GBP"
    }
  }
  
  var symbol: String {
    switch self {
    case .rub: return "₽"
    case .usd: return "$"
    case .eur: return "€"
    case .gbp: return "£"
    }
  }
  
}
