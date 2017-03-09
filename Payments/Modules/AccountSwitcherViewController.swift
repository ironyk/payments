//
//  AccountSwitcherViewController.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 09/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import UIKit

protocol IAccountSwitcher: IChildViewController {
  func setup(with accounts: [Account])
  weak var delegate: IAccountSwitcherDelegate? { get set }
  
  var account: Account? { get set }
}

protocol IAccountSwitcherDelegate: class {
  func accountSwitcher(_ accountSwitcher: IAccountSwitcher, didPickAccount account: Account?)
}

class AccountSwitcherViewController: UIViewController, IAccountSwitcher {
  
  var account: Account?
  func setup(with accounts: [Account]) {
    
  }
  
  weak var delegate: IAccountSwitcherDelegate?
  
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
}
