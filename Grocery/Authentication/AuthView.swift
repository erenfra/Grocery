//
//  AuthView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/29/24.
//

import SwiftUI

struct AuthView: View {
  @StateObject private var viewModel = AuthViewModel()
  @Binding var showAuthenticationView: Bool
    var body: some View {
      ZStack {
        Color(Color.background)
          .ignoresSafeArea()
        VStack(spacing: 20) {
          Image("LogIcon")
            .resizable()
            .scaledToFit()
            .frame(width: 130)
            //.padding()

          VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
              Text("Your Email")
                .foregroundStyle(Color.text)
              TextField("Enter your email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .padding()
                .foregroundStyle(Color.text)
                .overlay {
                  RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.text)
                }
            }
            VStack(alignment: .trailing, spacing: 10) {
              VStack(alignment: .leading, spacing: 10) {
                Text("Your Password")
                  .foregroundStyle(Color.text)
                SecureField("Enter your password", text: $viewModel.password)
                  .textInputAutocapitalization(.never)
                  .padding()
                  .foregroundStyle(Color.text)
                  .overlay {
                    RoundedRectangle(cornerRadius: 8)
                      .stroke(Color.text)
                  }
              }
              Button {
// Add the forgot password function
              } label: {
                Text("Forgot Password?")
                  .foregroundStyle(Color.text)
                  .font(.body.bold())
                  .multilineTextAlignment(.trailing)
              }
            }
          }
          Spacer()
          Button {
            Task {
              do {
                try await viewModel.signIn()
                showAuthenticationView = false
              } catch {

              }
            }
          } label: {
            PrimaryButton(title: "Log In")
          }
          Spacer()
          VStack {
            Text("Don't have an account?")
              .foregroundStyle(Color.text)
            Button {
              Task {
                do {
                  try await viewModel.signUp()
                  showAuthenticationView = false
                } catch {

                }
              }
            } label: {
              SecondaryButton(title: "Register")
            }
          }
          Spacer()
        }.padding()
      }
    }
}

#Preview {
  AuthView(showAuthenticationView: .constant(false))
}
