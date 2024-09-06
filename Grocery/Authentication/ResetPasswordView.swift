//
//  ResetPasswordView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 9/1/24.
//

import SwiftUI

struct ResetPasswordView: View {
  @Environment(\.dismiss) var dismiss
  @Binding var showAuthenticationView: Bool
  @StateObject private var viewModel = AuthViewModel()
  @State private var presentingResetAlert = false
  var body: some View {
    NavigationStack {
      VStack(spacing: 30) {
        VStack(alignment: .leading, spacing: 10) {
          Text("Your Email")
            .foregroundStyle(Color.text)
          TextField("Enter your email", text: $viewModel.emailResetPassword)
            .textInputAutocapitalization(.never)
            .padding()
            .foregroundStyle(Color.text)
            .overlay {
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color.text)
            }
        }
        VStack(spacing: 15) {
          Button {
            Task {
              do {
                try await viewModel.resetPassword()
                showAuthenticationView = true
                //dismiss()
                presentingResetAlert.toggle()
              } catch {
                
              }
            }
          } label: {
            PrimaryButton(title: "Reset Password")
          }
          Button {
            dismiss()
          } label: {
            SecondaryButton(title: "Dismiss")
          }
        }
        Spacer()
      }.padding()
        .alert(isPresented: $presentingResetAlert) { () -> Alert in
          Alert(title: Text("Reset email sent!"), 
                message: Text("Check your email with instructions to reset your password. Remember to check your Spam folder."),
                dismissButton: Alert.Button.default(Text("Dismiss"), action: { dismiss() })

          )
        }
      .navigationTitle("Forgot your password?")
      .navigationBarTitleDisplayMode(.inline)
    }.interactiveDismissDisabled()
  }
}

#Preview {
  ResetPasswordView(showAuthenticationView: .constant(false))
}
