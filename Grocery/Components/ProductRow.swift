//
//  ProductRow.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/31/24.
//

import SwiftUI

struct ProductRow: View {
  var product: String
  @State private var inCart: Bool = false
  @State private var isFavorite: Bool = false
  var body: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 15) {
        Image(systemName: inCart ? "checkmark.square.fill" : "square")
          .onTapGesture {
            inCart.toggle()
          }
        Text(product)
        Spacer()
        Image(systemName: isFavorite ? "heart.fill" : "heart")
          .onTapGesture {
            isFavorite.toggle()
          }
      }.font(.body)
        .foregroundStyle(Color.text)
    }
  }
}

#Preview {
  ProductRow(product: "Steak")
}
