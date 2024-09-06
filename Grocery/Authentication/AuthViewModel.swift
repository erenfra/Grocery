//
//  AuthViewModel.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/29/24.
//

import Foundation



@MainActor
final class AuthViewModel: ObservableObject {

  @Published var email = ""
  @Published var password = ""
  @Published var emailResetPassword = ""


  func signIn() async throws {
    guard !email.isEmpty, !password.isEmpty else {
      print("No email or password found")
      return
    }
    try await AuthenticationManager.shared.signInUser(email: email, password: password)

  }

  func signUp() async throws {
    guard !email.isEmpty, !password.isEmpty else {
      print("No email or password found")
      return
    }
    try await AuthenticationManager.shared.createUser(email: email, password: password)
  }

  func resetPassword() async throws {
    guard !emailResetPassword.isEmpty else {
      print("No email found")
      return
    }
    try await AuthenticationManager.shared.resetPassword(email: emailResetPassword)
  }

}
