//
//  ContentView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/26/24.
//
import SwiftData
import SwiftUI

struct MainView: View {
  @Environment(\.modelContext) var modelContext
  @Query var stores: [StoreData]
  @State private var showAuthenticationView = false
  @State private var showSettingsView = false
  @State private var showAddListView = false

  let columns = [GridItem(.adaptive(minimum: 150))]

  var body: some View {
    NavigationStack {
      ZStack {
        Color(Color.background)
          .ignoresSafeArea()
        ScrollView {
          LazyVGrid(columns: columns) {
            ForEach(stores) { store in
              NavigationLink(value: store) {
                StoreRow(name: store.name, image: "\(store.type)1")
              }
            }
          }.padding()
        }
        .navigationTitle("Lists")
        .navigationDestination(for: StoreData.self) { store in
          ListView(store: store)
        }
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


}

#Preview {
  MainView()
}
