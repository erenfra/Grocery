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
  @State private var newProduct = ""
  @FocusState private var addProductIsFocused: Bool

  var body: some View {
    ZStack {
      Color(Color.background)
        .ignoresSafeArea()
      Form {
        Section {
          HStack {
            TextField("Add a product to \(store) list", text: $newProduct)
              .focused($addProductIsFocused)
            Button("Add") {
              addProduct()
              addProductIsFocused = false
            }
          }
        }
        Section {
          ForEach(store.products) { product in
            ProductRow(product: product.item)
          }.onDelete(perform: removeProduct)
        }
      }
    }.navigationTitle("\(store.name)")
  }

  func addProduct() {
    guard newProduct.isEmpty == false else { return }
    withAnimation {
      let product = Product(item: newProduct)
      store.products.append(product)
      newProduct = ""
    }
  }

  func removeProduct(at offsets: IndexSet) {
    for offset in offsets {
      let product = store.products[offset]
      modelContext.delete(product)
    }

    store.products.remove(atOffsets: offsets)

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
