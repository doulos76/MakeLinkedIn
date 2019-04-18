//
//  Extension+UIColor.swift
//  MakeLinkedIn
//
//  Created by dave76 on 19/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

extension UIColor {
  static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
    return .init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
  }
  
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return .init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
  }
}
