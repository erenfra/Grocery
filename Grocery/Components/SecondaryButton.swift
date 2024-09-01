//
//  SecondaryButton.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/29/24.
//

import SwiftUI

struct SecondaryButton: View {
  var title: String
  var body: some View {
    Text(title)
      .font(.headline)
      .foregroundStyle(Color.textButton)
      .frame(height: 55)
      .frame(maxWidth: .infinity)
      .background(Color.secondaryButton)
      .cornerRadius(8)

  }
}

#Preview {
  SecondaryButton(title: "Register")
}
