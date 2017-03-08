//
//  AccountService.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 08/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import Foundation

protocol IAccountService {
  func accounts() -> [Account]
}

class FakeAccountService: IAccountService {
  
  static private var fakeAccounts: [Account] = [
    Account(identifier: "1",
            name: "Супер счет Black",
            balance: MoneyAmount(value: 500000, currency: .eur))
  ]
  
  func accounts() -> [Account] {
    return FakeAccountService.fakeAccounts
  }
  
}
