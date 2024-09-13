//
//  ListView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/12/24.
//

import SwiftUI
import SwiftData

struct ListView: View {
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) var modelContext
  var store: StoreData
  @State private var showAddProductView = false

  var body: some View {
    ZStack {
      Color(Color.background)
        .ignoresSafeArea()
      ScrollView {
        List {

        }.navigationTitle("\(store.name) List")
          .navigationBarTitleDisplayMode(.inline)
          .toolbar {
            Button {
              showAddProductView = true
            } label: {
              Image(systemName: "plus")
                .padding(.horizontal)
                .foregroundStyle(Color.text)
            }.sheet(isPresented: $showAddProductView) {

            }
          }
      }
    }
  }
}


#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: StoreData.self, configurations: config)
    let example = StoreData(name: "HEB", type: "Hardware")

    return ListView(store: example)
      .modelContainer(container)

  } catch {
    return Text("Failed to create preview: \(error.localizedDescription)")
  }

}
