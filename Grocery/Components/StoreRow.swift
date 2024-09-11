//
//  StoreRow.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/10/24.
//

import SwiftUI

struct StoreRow: View {
  var name: String
  var image: String
  var body: some View {
    ZStack {
      Color(Color.background)
        .ignoresSafeArea()
      VStack(alignment: .leading) {
        HStack(spacing: 0) {
          Image(image)
            .resizable()
            .scaledToFit()
            .frame(width:50)
          Spacer()
          Text(name)
            .font(.headline)
            .multilineTextAlignment(.center)
            .bold()
          Spacer()
        }.padding(10)
        .overlay {
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color.text)
      }
      }
    }

  }
}

#Preview {
    StoreRow(name: "H-E-B", image: "Grocery3")
}
