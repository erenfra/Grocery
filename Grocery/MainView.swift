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
        VStack {
          Image(systemName: "cart")
            .imageScale(.large)
            .foregroundStyle(.tint)
          Text("Your Grocery List App")
          Button {
            Task {
              do {
                try AuthenticationManager.shared.signOut()
                self.showAuthenticationView = true
              } catch {

              }
            }

          } label: {
            Text("Log Out")
              .font(.headline)
              .foregroundStyle(Color.white)
              .frame(height: 55)
              .frame(maxWidth: .infinity)
              .background(Color.blue)
              .cornerRadius(10)
          }
        }
        .padding()
      }
    }.onAppear {
      let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
      self.showAuthenticationView = authUser == nil
    }
    .fullScreenCover(isPresented: $showAuthenticationView) {
      NavigationStack{
        AuthenticationView(showAuthenticationView: $showAuthenticationView)
      }
    }
  }
}

#Preview {
  MainView()
}
