//
//  SettingsView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/27/24.
//

import SwiftUI

struct SettingsView: View {
  @Environment(\.dismiss) var dismiss
  @Binding var showAuthenticationView: Bool

  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        Button {

        } label: {
          PrimaryButton(title: "Share Grocery List")
        }
        Button {
          Task {
            do {
              try AuthenticationManager.shared.signOut()
              self.showAuthenticationView = true
            } catch {
            }
          }
        } label: {
          SecondaryButton(title: "Log Out")
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
  SettingsView(showAuthenticationView: .constant(false))
}
