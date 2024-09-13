//
//  ListView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/12/24.
//

import SwiftUI

struct ListView: View {
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) var modelContext

  var title: String
    var body: some View {
      NavigationStack {
        List {
          
        }.navigationTitle("\(title) List")
      }
    }
}

#Preview {
  ListView(title: "HEB")
}
