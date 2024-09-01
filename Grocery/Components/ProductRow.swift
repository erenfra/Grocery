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
          .foregroundStyle(Color.text)
          .font(.title)
          .onTapGesture {
            inCart.toggle()
          }
        Text(product)
          .font(.title)
          .foregroundStyle(Color.text)
        Spacer()
        Image(systemName: isFavorite ? "heart.fill" : "heart")
          .foregroundStyle(Color.text)
          .font(.title)
          .onTapGesture {
            isFavorite.toggle()
          }
      }
    }
  }
}

#Preview {
  ProductRow(product: "Steak")
}
