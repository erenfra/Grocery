//
//  GroceryApp.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/26/24.
//

import SwiftUI
import Firebase

@main
struct GroceryApp: App {

  init() {
    FirebaseApp.configure()
    print("Configured Firebase!")
  }
  var body: some Scene {
    WindowGroup {
      TabBar()
    }
  }
}
