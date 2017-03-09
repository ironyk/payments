//
//  HeaderViewController.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 09/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import UIKit

protocol IHeaderModule: IChildViewController {
  func setup(with provider: Provider)
  weak var delegate: IHeaderModuleDelegate? { get set }
}

protocol IHeaderModuleDelegate: class {
  func headerModule(_ headerModule: IHeaderModule, didTapHeader account: Account?)
}

class HeaderViewController: UIViewController, IHeaderModule {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
  func setup(with provider: Provider) {
    titleLabel.text = provider.title
    subtitleLabel.text = provider.subtitle
    imageView.image = provider.image
  }
  
  weak var delegate: IHeaderModuleDelegate?
  
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
}
