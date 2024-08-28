//
//  SignInView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/26/24.
//

import SwiftUI

struct SignUpView: View {

  @StateObject private var viewModel = SignUpViewModel()
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
            try await viewModel.signUp()
            showAuthenticationView = false
          } catch {
            
          }
        }
      } label: {
        Text("Sign Up")
          .font(.headline)
          .foregroundStyle(Color.white)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .cornerRadius(10)
      }
      Spacer()
    }.padding()
      .navigationTitle("Sign Up")
  }
}

#Preview {
  NavigationStack {
    SignUpView(showAuthenticationView: .constant(false))
  }
}
