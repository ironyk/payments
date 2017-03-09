//
//  FieldsViewController.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 09/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import UIKit

protocol IFieldsModule: IChildViewController {
  func setup(with fields: [Field])
  weak var delegate: IFieldsModuleDelegate? { get set }
  
  var fieldsValues: [Field: String] { get }
}

protocol IFieldsModuleDelegate: class {
  func fieldsModule(_ fieldsModule: IFieldsModule, didChangeField field: Field, with text: String)
}

class FieldsViewController: UIViewController, IFieldsModule {
  
  func setup(with fields: [Field]) {
    self.fields = fields
    var newFieldsValues: [Field: String] = [:]
    fields.forEach {
      newFieldsValues[$0] = ""
    }
    fieldsValues = newFieldsValues
    tableView?.reloadData()
  }
  fileprivate var fields: [Field] = []
  var fieldsValues: [Field : String] = [:] {
    didSet {
      let changedFields = fieldsValues.filter { oldValue[$0.key] != $0.value }
      changedFields.forEach {
        delegate?.fieldsModule(self, didChangeField: $0.key, with: $0.value)
      }
    }
  }
  
  weak var delegate: IFieldsModuleDelegate?
  
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  @IBOutlet private weak var tableView: UITableView!
  
  
}

extension FieldsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let field = fields[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = field.name
    cell.detailTextLabel?.text = fieldsValues[field]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return fields.count
  }
  
}
