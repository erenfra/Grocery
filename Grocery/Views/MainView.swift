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
  @State private var lists = Lists()
  let columns = [GridItem(.adaptive(minimum: 150))]

  var body: some View {
    NavigationStack {
      ZStack {
        Color(Color.background)
          .ignoresSafeArea()
        ScrollView {
          LazyVGrid(columns: columns) {
            ForEach(lists.stores) { store in
              StoreRow(name: store.name, image: "\(store.type)1")
            }
          }.padding()
//          .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//              Button {
//                showSettingsView = true
//              } label: {
//                Image(systemName: "gear")
//                  .padding(.horizontal)
//                  .foregroundStyle(Color.text)
//              }.sheet(isPresented: $showSettingsView) {
//                SettingsView(showAuthenticationView: $showAuthenticationView)
//                  .presentationDetents([.height(320)])
//                  .presentationBackground(.ultraThinMaterial)
//                  .presentationCornerRadius(25)
//              }
//            }
//            ToolbarItem(placement: .topBarTrailing) {
//              Button {
//                showAddListView = true
//              } label: {
//                Image(systemName: "plus")
//                  .padding(.horizontal)
//                  .foregroundStyle(Color.text)
//              }.sheet(isPresented: $showAddListView) {
//                AddListView()
//              }
//            }
//          }
        }
        .navigationTitle("Lists")
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

  func removeStore(at offsets: IndexSet) {
    lists.stores.remove(atOffsets: offsets)
  }
}

#Preview {
  MainView()
}
