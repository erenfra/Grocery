//
//  GroceryCard.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/31/24.
//

import SwiftUI

struct GroceryCard: View {
  var name: String
  var image: String
  var body: some View {
    VStack {
      Image(image)
        .resizable()
        .scaledToFit()
        .frame(width:100)
      Text(name)
        .font(.headline)
        .multilineTextAlignment(.center)
      .bold()
    }.frame(width: 150, height: 150)
    .overlay {
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color.text)
    }

  }
}

#Preview {
  GroceryCard(name: "H-E-B", image: "Home Decor3")
}
