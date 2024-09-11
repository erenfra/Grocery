//
//  DataModel.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/5/24.
//

import Foundation

struct ListItem: Identifiable {

  var id = UUID()
  var list: String
  var name: String
  var products: [Product] = []
  var icon: String

  struct Product: Identifiable {
    var id = UUID()
    var item: String
    var favorite: Bool
    var checked: Bool

  }

}

//@Observable
//class Lists {
//  var listItems = [ListItem]()
//}
