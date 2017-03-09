//
//  SumViewController.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 09/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import UIKit

protocol ISumModule: IChildViewController {
  var moneyAmount: MoneyAmount { get set }
  weak var delegate: ISumModuleDelegate? { get set }
}

protocol ISumModuleDelegate: class {
  func sumModule(_ sumModule: ISumModule, didChangeMoneyAmount moneyAmount: MoneyAmount)
}

class SumViewController: UIViewController, ISumModule {
  
  weak var delegate: ISumModuleDelegate?
  var moneyAmount: MoneyAmount = MoneyAmount(value: 0, currency: .rub) {
    didSet {
      delegate?.sumModule(self, didChangeMoneyAmount: moneyAmount)
    }
  }
  
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
}
