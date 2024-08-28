//
//  SignInView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/27/24.
//

import SwiftUI

struct SignInView: View {
  
  @StateObject private var viewModel = SignInViewModel()
  @Binding var showAuthenticationView: Bool

  var body: some View {
    VStack {
      TextField("Email...", text: $viewModel.email)
        .padding()
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
      SecureField("Password...", text: $viewModel.password)
        .padding()
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
      Button {
        Task {
          do {
            try await viewModel.signIn()
            showAuthenticationView = false
          } catch {

          }
        }

      } label: {
        Text("Sign In")
          .font(.headline)
          .foregroundStyle(Color.white)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .cornerRadius(10)
      }
      Spacer()
    }.padding()
      .navigationTitle("Sign In")
  }
}

#Preview {
  NavigationStack {
    SignInView(showAuthenticationView: .constant(false))
  }
}
