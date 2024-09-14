//
//  Product.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/13/24.
//

import Foundation
import SwiftData

@Model
class Product {
  var id = UUID()
  var item: String = ""
  var favorite: Bool = false
  var checked: Bool = false

  init(item: String = "", favorite: Bool = false, checked: Bool = false) {
    self.item = item
    self.favorite = favorite
    self.checked = checked
  }

}
