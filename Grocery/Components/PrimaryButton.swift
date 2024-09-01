//
//  PrimaryButton.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/29/24.
//

import SwiftUI

struct PrimaryButton: View {
  var title: String
  var body: some View {
    Text(title)
      .font(.headline)
      .foregroundStyle(Color.white)
      .frame(height: 55)
      .frame(maxWidth: .infinity)
      .background(Color.primaryButton)
      .cornerRadius(8)

  }
}

#Preview {
  PrimaryButton(title: "Log In")
}

