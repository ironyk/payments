//
//  ModulesFactory.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 08/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import UIKit

protocol IModulesFactory {
  func createAccountSwitcher(parent: UIViewController) -> IAccountSwitcher
  func createFieldsModule(parent: UIViewController) -> IFieldsModule
  func createHeaderModule(parent: UIViewController) -> IHeaderModule
  func createSumModule(parent: UIViewController) -> ISumModule
  func createPayButtonModule(parent: UIViewController) -> IPayButtonModule
}

class ModulesFactory: IModulesFactory {
  func createAccountSwitcher(parent: UIViewController) -> IAccountSwitcher {
    let accountSwitcherViewController = AccountSwitcherViewController()
    parent.addChildViewController(accountSwitcherViewController)
    accountSwitcherViewController.delegate = parent as? IAccountSwitcherDelegate
    return accountSwitcherViewController
  }
  func createFieldsModule(parent: UIViewController) -> IFieldsModule {
    let fieldsViewController = FieldsViewController()
    parent.addChildViewController(fieldsViewController)
    fieldsViewController.delegate = parent as? IFieldsModuleDelegate
    return fieldsViewController
  }
  func createHeaderModule(parent: UIViewController) -> IHeaderModule {
    let headerViewController = HeaderViewController()
    parent.addChildViewController(headerViewController)
    headerViewController.delegate = parent as? IHeaderModuleDelegate
    return headerViewController
  }
  func createSumModule(parent: UIViewController) -> ISumModule {
    let sumViewController = SumViewController()
    parent.addChildViewController(sumViewController)
    sumViewController.delegate = parent as? ISumModuleDelegate
    return sumViewController
  }
  func createPayButtonModule(parent: UIViewController) -> IPayButtonModule {
    let payButtonViewController = PayButtonViewController()
    parent.addChildViewController(payButtonViewController)
    payButtonViewController.delegate = parent as? IPayButtonModuleDelegate
    return payButtonViewController
  }
}

protocol IChildViewController {
  var view: UIView! { get }
  func didMove(toParentViewController: UIViewController?)
}

protocol Validatable {
  /// Validates and displays alerts/errors
  func validate() -> Bool
  
  /// Returns true if state is valid
  var isValid: Bool { get }
}
