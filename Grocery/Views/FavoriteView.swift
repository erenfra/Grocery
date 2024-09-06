//
//  FavoriteView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/29/24.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
      ZStack {
        Color(Color.background)
          .ignoresSafeArea()
        Text("Favorites")
          .foregroundStyle(Color.text)
      }
    }
}

#Preview {
    FavoriteView()
}
