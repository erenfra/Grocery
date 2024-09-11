//
//  TabBar.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/29/24.
//

import SwiftUI

struct TabBar: View {
  @State private var showSplash = true
  var body: some View {
    ZStack {
      TabView {
        MainView()
          .tabItem {
            Label("Lists", systemImage: "list.bullet.clipboard")
          }
        FavoritesView()
          .tabItem {
            Label("Favourites", systemImage: "heart")
          }
      }.tint(.text)
        .opacity(showSplash ? 0 : 1)

      SplashView()
        .opacity(showSplash ? 1 : 0)
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation() {
              self.showSplash = false
            }
          }
        }
    }
  }
}

#Preview {
  TabBar()
}
