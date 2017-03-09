//
//  PayButtonViewController.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 09/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import UIKit

protocol IPayButtonModule: IChildViewController {
  weak var delegate: IPayButtonModuleDelegate? { get set }
  
  func update(with moneyAmount: MoneyAmount)
}

protocol IPayButtonModuleDelegate: class {
  func payButtonModule(_ payButtonModule: IPayButtonModule, didTapHeader sender: AnyObject?)
}

class PayButtonViewController: UIViewController, IPayButtonModule {
  
  func update(with moneyAmount: MoneyAmount) {
    
  }
  weak var delegate: IPayButtonModuleDelegate?
  
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
}
