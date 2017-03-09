//
//  PayViewController.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 08/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import UIKit

class PayViewController: UIViewController {
  
  let providerId = "galchonok"
  
  // Dependencies
  private let providerService = ServiceLocator.shared.providerService()
  private let accountService = ServiceLocator.shared.accountService()
  private let modulesFactory = ServiceLocator.shared.modulesFactory()
  
  // Modules
  private lazy var accountSwitcher: IAccountSwitcher = self.modulesFactory.createAccountSwitcher(parent: self)
  private lazy var headerModule: IHeaderModule = self.modulesFactory.createHeaderModule(parent: self)
  private lazy var fieldsModule: IFieldsModule = self.modulesFactory.createFieldsModule(parent: self)
  private lazy var sumModule: ISumModule = self.modulesFactory.createSumModule(parent: self)
  private lazy var payButtonModule: IPayButtonModule = self.modulesFactory.createPayButtonModule(parent: self)

  // View Controller
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let provider = providerService.providerForId(providerId) else {
      let alertController = UIAlertController(title: "Error",
                                              message: "Unable to retrieve provider",
                                              preferredStyle: .alert)
      alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
      present(alertController, animated: true, completion: nil)
      return
    }
    let accounts = accountService.accounts()
    setup(with: provider, accounts: accounts)
  }
  
  private func setup(with provider: Provider, accounts: [Account]) {
    accountSwitcher.setup(with: accounts)
    headerModule.setup(with: provider)
    fieldsModule.setup(with: provider.fields)
  }

}
