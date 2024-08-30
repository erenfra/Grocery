//
//  SecondaryButton.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/29/24.
//

import SwiftUI

struct SecondaryButton: View {
    var body: some View {
      Text("Register")
        .font(.headline)
        .foregroundStyle(Color.textButton)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(Color.secondaryButton)
        .cornerRadius(8)

    }
}

#Preview {
    SecondaryButton()
}
