//
//  PayViewController.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 08/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import UIKit

class PayViewController: UIViewController {
  
  //
  let providerId = "galchonok"
  
  // Dependencies
  private let providerService = ServiceLocator.shared.providerService()
  private let accountService = ServiceLocator.shared.accountService()
  
  // Outlets
  @IBOutlet weak var accountSwitcherView: AccountSwitcherView!
  @IBOutlet weak var headerView: HeaderView!
  @IBOutlet weak var fieldsView: FieldsView!
  @IBOutlet weak var sumView: SumView!
  @IBOutlet weak var payButtonView: PayButtonView!

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
    
    accountSwitcherView.setup(with: accounts)
    
    headerView.titleLabel.text = provider.title
    headerView.subtitleLabel.text = provider.subtitle
    headerView.imageView.image = provider.image
    
    fieldsView.setup(with: provider.fields)
    
  }

}
