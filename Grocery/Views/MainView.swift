//
//  ContentView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/26/24.
//

import SwiftUI

struct MainView: View {

  @State private var showAuthenticationView = false
  @State private var showSettingsView = false
  @State private var showAddListView = false


  var body: some View {
    ZStack {
      NavigationStack {
        ZStack {
          Color(Color.background)
            .ignoresSafeArea()
          VStack {
            Text("Your Grocery List App")
              .foregroundStyle(Color.text)
          }
          .padding()
          .toolbar {
            ToolbarItem(placement: .topBarLeading) {
              Button {
                showSettingsView = true
              } label: {
                Image(systemName: "gear")
                  .padding(.horizontal)
                  .foregroundStyle(Color.text)
              }.sheet(isPresented: $showSettingsView) {
                SettingsView(showAuthenticationView: $showAuthenticationView)
                  .presentationDetents([.height(320)])
                  .presentationBackground(.ultraThinMaterial)
                  .presentationCornerRadius(25)
              }
            }
            ToolbarItem(placement: .topBarTrailing) {
              Button {
                showAddListView = true
              } label: {
                Image(systemName: "plus")
                  .padding(.horizontal)
                  .foregroundStyle(Color.text)
              }.sheet(isPresented: $showAddListView) {
                AddListView()
              }
            }
        }
        }.navigationTitle("Lists")
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
