//
//  ContentView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/26/24.
//

import SwiftUI

struct MainView: View {

  @State private var showAuthenticationView = false

  var body: some View {
    ZStack {

      NavigationStack {
        ZStack {
          Color(Color.background)
            .ignoresSafeArea()
          VStack {
            Image(systemName: "cart")
              .imageScale(.large)
              .foregroundStyle(.tint)
            Text("Your Grocery List App")
          }
          .padding()
          .toolbar {
            ToolbarItem(placement: .topBarLeading) {
              Button {

              } label: {
                Image(systemName: "gear")
                  .padding(.horizontal)
              }
            }
            ToolbarItem(placement: .topBarTrailing) {
              Button {
                Task {
                  do {
                    try AuthenticationManager.shared.signOut()
                    self.showAuthenticationView = true
                  } catch {
                  }
                }
              } label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                  .padding(.horizontal)
              }
            }
        }
        }
      }
    }.onAppear {
      let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
      self.showAuthenticationView = authUser == nil
    }
    .fullScreenCover(isPresented: $showAuthenticationView) {
      NavigationStack{
        AuthView(showAuthenticationView: $showAuthenticationView)
      }
    }
  }
}

#Preview {
  MainView()
}
