//
//  DeleteButton.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/31/24.
//

import SwiftUI

struct DeleteButton: View {
  var title: String
  var body: some View {
    Text(title)
      .font(.headline)
      .foregroundStyle(Color.white)
      .frame(height: 55)
      .frame(maxWidth: .infinity)
      .background(Color.red)
      .cornerRadius(8)

  }
}

#Preview {
  DeleteButton(title: "Delete")
}
