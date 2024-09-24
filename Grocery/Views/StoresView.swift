//
//  StoresView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/12/24.
//
import SwiftData
import SwiftUI

struct StoresView: View {
  @Environment(\.modelContext) var modelContext
  @Query(sort: [SortDescriptor(\StoreData.name)]) var stores: [StoreData]
  var body: some View {
    NavigationStack {
      ZStack {
        Color(Color.background)
          .ignoresSafeArea()
        VStack {
          List {
            ForEach(stores) { store in
              HStack {
                Image("\(store.type)1")
                  .resizable()
                  .scaledToFit()
                  .frame(width:30)
                Text(store.name)
                  .font(.headline)
                  .multilineTextAlignment(.center)
                  .bold()
                Spacer()
              }
            }.onDelete(perform: removeStore)
          }

        }.scrollContentBackground(.hidden)

      }.navigationTitle("List of Stores")
    }
  }

  func removeStore(at offsets: IndexSet) {
    for offset in offsets {
      let store = stores[offset]
      modelContext.delete(store)
    }

  }
}


#Preview {

  StoresView()

}
