//
//  PickerRow.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/5/24.
//

import SwiftUI

struct PickerRow: View {
  var name: String
  var body: some View {
    HStack(spacing: 0) {
      Image("\(name)1")
        .resizable()
        .scaledToFit()
        .frame(width: 40)
      Spacer()
      Text(name)
        //.font(.title)

    }.frame(width: 200)
  }
}

#Preview {
  PickerRow(name: "Grocery")
}
