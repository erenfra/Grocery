//
//  SettingsView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/27/24.
//

import SwiftUI

struct SettingsView: View {
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        Button {

        } label: {
          PrimaryButton(title: "Share Grocery List")
        }
        Button(role: .destructive) {

        } label: {
          DeleteButton(title: "Delete Account")
        }
        Spacer()
      }.padding()
        .padding(.vertical, 20)
        .navigationTitle("Settings")
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
  SettingsView()
}
