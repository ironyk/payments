//
//  Field.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 08/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import Foundation

struct Field {
  let identifier: String
  let name: String
  let regexp: String?
}

extension Field: Hashable {
  var hashValue: Int {
    return identifier.hashValue
  }
  public static func ==(lhs: Field, rhs: Field) -> Bool {
    return lhs.identifier == rhs.identifier
  }
}
