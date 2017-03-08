//
//  TriangleView.swift
//  Payments
//
//  Created by Nikolay Sidiropulo on 08/03/2017.
//  Copyright © 2017 A|A. All rights reserved.
//

import UIKit

@IBDesignable
class TriangleView: UIView {

  override func draw(_ rect: CGRect) {
    let mask = CAShapeLayer()
    mask.frame = self.layer.bounds
    let width = self.layer.frame.size.width
    let height = self.layer.frame.size.height
    let path = CGMutablePath()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: width, y: 0))
    path.addLine(to: CGPoint(x: width/2, y: height))
    path.addLine(to: CGPoint(x: 0, y: 0))
    mask.path = path
    self.layer.mask = mask
  }

}
