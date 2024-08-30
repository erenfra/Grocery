//
//  TabBar.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/29/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
      TabView {
        MainView()
          .tabItem {
            Label("Cart", systemImage: "cart")
           }
        FavoriteView()
          .tabItem {
            Label("Cart", systemImage: "heart")
           }
      }
    }
}

#Preview {
    TabBar()
}
