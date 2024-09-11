//
//  Store.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/10/24.
//

import Foundation

struct StoreData: Identifiable {
  var id = UUID()
  var name: String
  var type: String

}

@Observable
class Lists {
  var stores = [StoreData]()
}
