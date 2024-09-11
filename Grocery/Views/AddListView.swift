//
//  AddListView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/5/24.
//

import SwiftUI

struct AddListView: View {
  @Environment(\.dismiss) var dismiss
  @State private var storeType = "Grocery"
  @State private var name = ""
  var stores = ["Art Supply" , "Bakery", "Garden" , "Grocery", "Hardware", "Home Decor", "Pharmacy"]
  var lists: Lists
  var body: some View {
    NavigationStack {
      ZStack {
        Color(Color.background)
          .ignoresSafeArea()
        VStack(alignment: .leading, spacing: 30) {
          VStack(alignment: .leading, spacing: 10) {
            Text("List Name")
              .foregroundStyle(Color.text)

            TextField("Enter list name", text: $name)
              .foregroundStyle(Color.text)
              .padding()
              .overlay {
                RoundedRectangle(cornerRadius: 10)
                  .stroke(Color.text)
            }
          }
          VStack(alignment: .leading) {
            Text("List Type")
              .foregroundStyle(Color.text)
            Picker(selection: $storeType, label: Text("List Type")) {
              ForEach(stores, id: \.self) { store in
                PickerRow(name: store)
              }
            }.pickerStyle(.wheel)
              .overlay {
                RoundedRectangle(cornerRadius: 10)
                  .stroke(Color.text)
              }

          }


          Button {
            dismiss()
          } label: {
            PrimaryButton(title: "Save")
          }
          Spacer()
        }.padding()
      }.navigationTitle("Add New List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button {
              dismiss()
            } label: {
              Image(systemName: "arrow.left")
                .padding(.horizontal)
                .foregroundStyle(Color.text)
            }
          }
        }
    }.interactiveDismissDisabled()
  }
}

#Preview {
  AddListView(lists: Lists())
}
