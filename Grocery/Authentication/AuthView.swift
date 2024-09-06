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
  @State private var showResetPassord: Bool = false

    var body: some View {
      ZStack {
        Color(Color.background)
          .ignoresSafeArea()
        VStack(spacing: 30) {
          Image("Splash")
            .resizable()
            .scaledToFit()
            .frame(width: 120)
            .padding()
            .overlay {
              RoundedRectangle(cornerRadius: 10)
                .stroke(Color.text)
            }

          VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
              Text("Your Email")
                .foregroundStyle(Color.text)
              TextField("Enter your email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .padding()
                .foregroundStyle(Color.text)
                .overlay {
                  RoundedRectangle(cornerRadius: 10)
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
                    RoundedRectangle(cornerRadius: 10)
                      .stroke(Color.text)
                  }
              }
              Button {
                showResetPassord.toggle()
              } label: {
                Text("Forgot Password?")
                  .foregroundStyle(Color.text)
                  .font(.body.bold())
                  .multilineTextAlignment(.trailing)
              }.sheet(isPresented: $showResetPassord) {
                ResetPasswordView(showAuthenticationView: $showAuthenticationView)
                  .presentationDetents([.height(320)])
                  .presentationBackground(.thickMaterial)
                  .presentationCornerRadius(25)
              }
            }
          }
          Spacer()
          Button {
            Task {
              do {
                guard !viewModel.email.isEmpty, !viewModel.password.isEmpty else {
                  showAuthenticationView = true
                  return
                }
                try await AuthenticationManager.shared.signInUser(email: viewModel.email, password: viewModel.password)
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
