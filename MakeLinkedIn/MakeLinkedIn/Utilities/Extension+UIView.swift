//
//  Extension+UIView.swift
//  MakeLinkedIn
//
//  Created by dave76 on 19/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

extension UIView {
  func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeading: CGFloat, paddingBottom: CGFloat, paddingTrailing: CGFloat, width: CGFloat, height: CGFloat) {
    
    translatesAutoresizingMaskIntoConstraints = false
    
    if let top = top {
      self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    
    if let leading = leading {
      self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
    }
    
    if let bottom = bottom {
      self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
    }
    
    if let trailing = trailing {
      self.trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
    }
    
    if width != 0 {
      self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    if height != 0 {
      self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
}
