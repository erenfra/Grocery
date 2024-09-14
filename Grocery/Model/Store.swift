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
  @Relationship(deleteRule: .cascade) var products = [Product]()

  init(id: UUID = UUID(), name: String, type: String, products: [Product] = [Product]()) {
    self.id = id
    self.name = name
    self.type = type
    self.products = products
  }

}




