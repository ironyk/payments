//
//  ProviderService.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 08/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import UIKit

protocol IProviderService {
  func providerForId(_ providerId: String) -> Provider?
}

class FakeProviderService: IProviderService {
  
  static private var fakeProviders: [Provider] = [
    Provider(identifier: "galchonok",
             title: "Галчонок",
             subtitle: "Благотворительный фонд",
             image: UIImage(named: "galchonok")!,
             fields: [
              Field(identifier: "phone", name: "Номер телефона", regexp: nil)
      ])
  ]
  
  func providerForId(_ providerId: String) -> Provider? {
    return FakeProviderService.fakeProviders.first { $0.identifier == providerId }
  }
}
