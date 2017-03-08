//
//  ServiceLocator.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 08/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import Foundation

class ServiceLocator {
  static let shared = ServiceLocator()
  
  func providerService() -> IProviderService {
    return FakeProviderService()
  }
  
  func accountService() -> IAccountService {
    return FakeAccountService()
  }
  
}
