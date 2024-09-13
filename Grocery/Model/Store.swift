//
//  Store.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/10/24.
//

import Foundation
import SwiftData

@Model
class StoreData: Identifiable {
  var id = UUID()
  var name: String
  var type: String
//  var products: [Product]

  init(id: UUID = UUID(), name: String, type: String) {
    self.id = id
    self.name = name
    self.type = type
    //self.products = products
  }

}

struct Product: Identifiable {
  var id = UUID()
  var item: String = ""
  var favorite: Bool = false
  var checked: Bool = false

}


